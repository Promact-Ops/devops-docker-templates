#!/bin/bash

# Exit on any error and treat unset variables as error when possible
set -e

# Required environment variables (must be supplied by caller)
REQUIRED_VARS=(PROJECT_NAME ENVIRONMENT VPS_USER_NAME)
for _var in "${REQUIRED_VARS[@]}"; do
  if [ -z "${!_var:-}" ]; then
    echo "Error: required environment variable '$_var' is not set."
    echo "Please export $_var before running this script, e.g.: export $_var=VALUE"
    exit 1
  fi
done

# Update system packages
apt-get update -y

# Install required packages for Docker
apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg \
    lsb-release \
    software-properties-common


if command -v docker &> /dev/null
then
    echo "Docker is already installed. Skipping installation..."

else
    echo "Docker not found. Installing Docker ..."
    echo "Starting Docker installation on Ubuntu $(lsb_release -rs)..."

    # Add Docker's official GPG key
    sudo apt install ca-certificates curl
    sudo install -m 0755 -d /etc/apt/keyrings
    sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
    sudo chmod a+r /etc/apt/keyrings/docker.asc

    # Add the repository to Apt sources:
    sudo tee /etc/apt/sources.list.d/docker.sources <<EOF
Types: deb
URIs: https://download.docker.com/linux/ubuntu
Suites: $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}")
Components: stable
Signed-By: /etc/apt/keyrings/docker.asc
EOF

    
    # Update package index
    apt-get update -y

    # Install Docker Engine
    apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

    # Start and enable Docker service
    systemctl start docker
    systemctl enable docker

  # Add specified user to docker group
  usermod -aG docker "${VPS_USER_NAME}"

  # Install Docker Compose standalone (as backup)
  curl -fsSL "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
  chmod +x /usr/local/bin/docker-compose

    # Create symlink for docker-compose
    ln -sf /usr/local/bin/docker-compose /usr/bin/docker-compose

    # Wait a moment for Docker to fully start
    sleep 10

    # Verify Docker installation
    echo "Docker installation completed successfully!"
    echo "Docker version: $(docker --version)"
    echo "Docker Compose version: $(docker-compose --version)"
    echo "Docker service status: $(systemctl is-active docker)"

    # Test Docker functionality
    docker run --rm hello-world
fi

# Create project folder structure
echo "Creating project folder structure..."
PROJECT_FOLDER="_${PROJECT_NAME}-${ENVIRONMENT}-server"
BASE_PATH="/home/${VPS_USER_NAME}/$PROJECT_FOLDER"
# Check if folder exists
if [ -d "$BASE_PATH" ]; then
    echo "Folder with the same name already exists. Please choose a different name."
    exit 0
else
  mkdir -p "/home/${VPS_USER_NAME}/${PROJECT_FOLDER}/frontend"
  mkdir -p "/home/${VPS_USER_NAME}/${PROJECT_FOLDER}/backend"

  # Set proper ownership and permissions
  chown -R "${VPS_USER_NAME}:${VPS_USER_NAME}" "/home/${VPS_USER_NAME}/${PROJECT_FOLDER}"
  chmod -R 755 "/home/${VPS_USER_NAME}/${PROJECT_FOLDER}"

  # Create docker-compose.yml directly with embedded template
  echo "Creating docker-compose.yml with embedded template..."
  cd /home/${VPS_USER_NAME}/$PROJECT_FOLDER

  # Download docker-compose template from GitHub
  echo "Downloading docker-compose template from GitHub..."
  cd /home/${VPS_USER_NAME}/$PROJECT_FOLDER
  curl -o docker-compose-template.yml https://raw.githubusercontent.com/Promact-Ops/devops-docker-templates/main/docker-compose-templates/docker-compose-Template-01.yml

  if [ -f "docker-compose-template.yml" ]; then
    echo "Template downloaded successfully. Customizing for project..."

    # Replace placeholders with actual values
    sed -i "s/\[PROJECTNAME_PH\]/${PROJECT_NAME}/g" docker-compose-template.yml
    sed -i "s/\[ENVIRONMENT_PH\]/${ENVIRONMENT}/g" docker-compose-template.yml

    # Create the final docker-compose.yml
    mv docker-compose-template.yml docker-compose.yml

    echo "✅ Docker Compose file customized and created:"
    echo "  - Project Name: ${PROJECT_NAME}"
    echo "  - Environment: ${ENVIRONMENT}"
    echo "  - File: /home/${VPS_USER_NAME}/${PROJECT_FOLDER}/docker-compose.yml"

    # Show the customized content
    echo "Customized docker-compose.yml content:"
    cat docker-compose.yml
  else
    echo "⚠️  Warning: Failed to download docker-compose template"
    echo "You may need to manually create /home/${VPS_USER_NAME}/${PROJECT_FOLDER}/docker-compose.yml"
  fi

  echo "Project folders created:"
  echo "  - /home/${VPS_USER_NAME}/$PROJECT_FOLDER/"
  echo "  - /home/${VPS_USER_NAME}/$PROJECT_FOLDER/frontend/"
  echo "  - /home/${VPS_USER_NAME}/$PROJECT_FOLDER/backend/"
  echo "  - /home/${VPS_USER_NAME}/$PROJECT_FOLDER/docker-compose.yml"

  echo "=========================================="
  echo "✅ Docker Setup Completed Successfully!"
  echo "=========================================="
  echo "Docker Engine and Docker Compose are now available"
  echo "Project folder structure created in /home/${VPS_USER_NAME}/$PROJECT_FOLDER/"
  echo "Docker Compose file customized for your project"
  echo "You can now run Docker commands as the ubuntu user"
  echo "Happy containerizing! 🐳" 
fi