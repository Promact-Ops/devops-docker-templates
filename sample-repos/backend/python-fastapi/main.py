from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from datetime import datetime
import uvicorn

app = FastAPI(
    title="FastAPI Sample App",
    description="A sample FastAPI application for the Promact Reusability Initiative",
    version="1.0.0"
)

# Add CORS middleware
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

@app.get("/")
async def root():
    return {
        "message": "Welcome to FastAPI Sample App",
        "description": "Promact Reusability Initiative - Python FastAPI",
        "endpoints": ["/", "/test", "/health"],
        "timestamp": datetime.utcnow().isoformat()
    }

@app.get("/test")
async def test():
    return {
        "message": "Promact Reusability Initiative - Python - FastAPI build using Docker",
        "timestamp": datetime.utcnow().isoformat(),
        "status": "success"
    }

@app.post("/test")
async def test_post():
    return {
        "message": "Promact Reusability Initiative - Python - FastAPI build using Docker",
        "method": "POST",
        "timestamp": datetime.utcnow().isoformat(),
        "status": "success"
    }

@app.get("/health")
async def health_check():
    return {
        "status": "healthy",
        "service": "FastAPI Sample App",
        "timestamp": datetime.utcnow().isoformat()
    }

if __name__ == "__main__":
    uvicorn.run(app, host="0.0.0.0", port=8000)
