# 🚀 Docker Compose Project

This project is my first experience using Docker Compose! I learned how to build and run both frontend and backend images simultaneously, without building them one by one.

## 🛠️ What I Did

- Created separate Dockerfiles for the frontend and backend
- Wrote a `docker-compose.yml` file to manage both services
- Used Docker Compose to build and start both containers together

## 📦 How to Build & Run

1. **Build and start all services:**
   ```sh
   docker-compose up --build
   ```

Access your apps:
Frontend: http://localhost:3000 (or your configured port)
Backend: http://localhost:5000 (or your configured port)
📁 Files
frontend/Dockerfile — Docker instructions for the frontend
backend/Dockerfile — Docker instructions for the backend
docker-compose.yml — Compose file to manage both services

💡 What I Learned
How to use Docker Compose to manage multi-container applications
How to build multiple images at once
How to link frontend and backend services together
This is the start of my Docker Compose journey! 