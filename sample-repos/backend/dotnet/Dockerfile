#DevOps Reusability
# IMPORTANT: Change TestApi.csproj and TestApi.dll names according to your project file
# DO NOT change port 8080
FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS base
WORKDIR /app
EXPOSE 8080

FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src
COPY ["TestApi.csproj", "./"]
RUN dotnet restore "TestApi.csproj"
COPY . .
RUN dotnet build "TestApi.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "TestApi.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "TestApi.dll"]
