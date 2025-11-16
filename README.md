# GitOps Node.js Application with ArgoCD, Kubernetes & GitHub Actions

This repository demonstrates a fully automated **GitOps workflow** that deploys a Node.js application into a Kubernetes cluster using **GitHub Actions**, **Docker Hub**, and **ArgoCD**.

Whenever code is pushed to this repository:

1. GitHub Actions builds a new Docker image  
2. Tags it using the commit SHA  
3. Pushes it to Docker Hub  
4. Updates the Kubernetes deployment manifest  
5. ArgoCD detects the change and deploys it automatically  

This ensures a fully automated CI/CD pipeline with no manual steps.

---

## 🚀 Architecture Overview

Developer → GitHub → GitHub Actions → Docker Hub → GitOps Repo → ArgoCD → Kubernetes


---

## 🏗️ Technologies Used

- Node.js 18
- Docker & Docker Hub
- GitHub Actions
- ArgoCD (GitOps)
- Kubernetes
- Distroless Runtime Image (Google distroless)
- Multi-stage Docker build

---

## 📂 Project Structure

app/
├── index.js
├── package.json
├── Dockerfile

manifests/
├── deployment.yaml
├── service.yaml


---

## 🐳 Dockerfile (Distroless Multi-Stage)

```dockerfile
# 1. Build dependencies with alpine image
FROM node:18-alpine AS build
WORKDIR /app

COPY package*.json ./
RUN npm ci --omit=dev
COPY . .

# 2. Then run in distroless image (much smaller)
FROM gcr.io/distroless/nodejs18
WORKDIR /app
COPY --from=build /app .

EXPOSE 3000
CMD ["index.js"]

🔄 CI/CD Pipeline (GitHub Actions)

The GitHub Actions workflow performs:

Build Docker image

Tag image with Git commit SHA

Push image to Docker Hub

Update Kubernetes deployment manifest

Commit changes back to GitOps repository

ArgoCD continuously monitors the GitOps repo and deploys new images automatically.

🚀 ArgoCD Deployment Flow

ArgoCD performs:

Auto-sync of updated Kubernetes YAML

Rolling updates of Node.js app

Version-controlled deployments

Health checks & rollback if needed

To verify the deployed image in Kubernetes:

kubectl get pods -n default
kubectl describe pod <pod-name> | grep Image

🧪 Local Testing (Optional)

Forward service to your local machine:

kubectl port-forward svc/nodejs-app-default 3000:3000 -n default

Then open:

👉 http://localhost:3000

🤝 Contributions

Contributions, issues, and feature requests are welcome!

📢 Connect

If you found this helpful, please ⭐ star the repo and share it!
