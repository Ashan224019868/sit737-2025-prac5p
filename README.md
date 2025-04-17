
# Dockerizing Calculator Microservice

This guide will help you containerize Node.js calculator microservice using Docker and Docker Compose. It also includes a health check setup and steps to push image to a container registry.

---

## Step-by-Step Dockerization

### 1. Create a `Dockerfile`

```Dockerfile
FROM node:18
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
EXPOSE 3000
CMD ["node", "index.js"]
```

### 2. Create a `docker-compose.yml`

```yaml
version: '3.8'

services:
  calculator:
    build: .
    ports:
      - "3000:3000"
    healthcheck:
      test: ["CMD", "curl", "-f", "http://localhost:3000/add?num1=1&num2=1"]
      interval: 30s
      timeout: 10s
      retries: 3
    restart: on-failure
```

---

## 3. Build the Docker Image

```bash
docker build -t calculator .
```

---

## 4. Start with Docker Compose

```bash
docker-compose up --build
```

This will:
- Build the image
- Start the container
- Run health checks
- Restart on failure (if needed)

---

## 5. Test the Microservice

Open browser or Postman:

```
http://localhost:3000/add?num1=5&num2=2
http://localhost:3000/subtract?num1=10&num2=4
```

---

## 6. Push Docker Image to Docker Hub

### Step 1: Login to Docker

```bash
docker login
```

### Step 2: Tag the Image

```bash
docker tag calculator username/calculator
```

### Step 3: Push the Image

```bash
docker push username/calculator
```
