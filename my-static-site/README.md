# 🚀 My First Docker Static Site

This project is my first lesson in Docker! I created a custom Docker image that serves a static HTML page using the official NGINX base image.

## 🛠️ What I Did

- Wrote a simple `index.html` file
- Used the official `nginx:alpine` image as the base
- Built a Docker image that copies my HTML file into NGINX’s web root
- Ran the container locally to view my site

## 📦 How to Build & Run

1. **Build the Docker image:**
   ```sh
   docker build -t my-static-site .
   ```

2. Run the container:
```
docker run -p 8080:80 my-static-site
```

3. Visit in your browser:
http://localhost:8080


📁 Files
index.html — My custom homepage
Dockerfile — Instructions to build the image
💡 What I Learned
How to use Docker to containerize a static website
How to use NGINX as a web server inside a container
Basics of Dockerfile syntax and image building
This is the start of my Docker journey!
