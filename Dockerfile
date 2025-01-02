Q: What is a Dockerfile and why do we need it?
A:
- A blueprint for creating Docker images
- Contains instructions for building an application into a container
- Part of application code (like docker-compose.yaml)
- Enables automated and consistent image building

Q: What is the basic structure of a Dockerfile?
A:
```
# Base image
FROM node:latest

# Environment variables
ENV KEY=value

# Execute commands
RUN mkdir -p /home/app

# Copy files from host to container
COPY . /home/app

# Entry point command
CMD ["node", "server.js"]
```

Q: What's the difference between RUN and CMD commands?
A:
1. RUN:
   - Executes during image build
   - Can have multiple RUN commands
   - Used for installing dependencies, creating directories
   - Executes inside container environment

2. CMD:
   - Specifies the entry point command
   - Only one CMD effective per Dockerfile
   - Runs when container starts
   - Can be overridden at runtime

Q: How does the FROM instruction work?
A:
- Specifies the base image
- Always the first instruction in Dockerfile
- Examples:
  ```
  FROM node:latest     Latest Node.js image
  FROM node:14         Specific Node.js version
  FROM ubuntu:20.04    Ubuntu base image
  ```
- Provides pre-installed tools/runtime (like Node.js)

Q: What's the difference between COPY and RUN cp commands?
A:
```
# COPY executes on host, copies from host to container
COPY ./app /home/app

# RUN cp executes inside container
RUN cp /source /destination
```
Key differences:
- COPY: Host → Container transfer
- RUN cp: Container → Container transfer

Q: How do environment variables work in Dockerfiles?
A:
```
# In Dockerfile (build time)
ENV NODE_ENV=production
ENV PORT=3000

# Better practice: Use docker-compose.yaml (runtime)
services:
  app:
    environment:
      - NODE_ENV=production
      - PORT=3000
```
- ENV in Dockerfile: Hardcoded, requires rebuild
- docker-compose: More flexible, can change without rebuild

Q: What's the typical workflow for building and deploying an application?
A:
1. Development:
   - Write application code
   - Create Dockerfile
   - Create docker-compose.yaml (if needed)

2. Build Process:
   - Build Docker image from Dockerfile
   - Test the image locally
   - Push to Docker registry

3. CI/CD (e.g., Jenkins):
   - Pulls code
   - Builds application
   - Creates Docker image
   - Pushes to registry
   - Deploys to environment

Q: What are best practices for Dockerfile creation?
A:
1. Base Image Selection:
   - Use official images
   - Choose specific versions
   - Use lightweight images when possible

2. Optimization:
   - Combine RUN commands using &&
   - Use .dockerignore
   - Order instructions by change frequency

3. Security:
   - Don't store secrets in Dockerfile
   - Use multi-stage builds
   - Minimize image size

4. Maintainability:
   - Document with comments
   - Keep it simple
   - Follow consistent naming conventions

This provides a foundation for understanding how to package applications into Docker containers using Dockerfiles.
