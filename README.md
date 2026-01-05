<<<<<<< HEAD
# WordPress-clone
Used For Hands On Practice For DevOps Tools
=======
# WordPress Demo with Docker, Jenkins & Kubernetes

This repository contains a minimal setup to run WordPress locally with Docker, build and push the WordPress image via Jenkins, and deploy to Kubernetes.

Contents
- `docker-compose.yml` — local dev (WordPress + MySQL)
- `wordpress-app/Dockerfile` — custom WordPress image (based on official image)
- `Jenkinsfile` — pipeline to build/push image and deploy to k8s
- `jenkins/Dockerfile` — example Jenkins image with docker & kubectl
- `k8s/` — Kubernetes manifests (MySQL, WordPress, Services, PVCs, Secrets)

Quickstart (local)
1. Start local environment:
   - docker-compose up -d
2. Browse http://localhost:8080

Continuous Integration
- Configure a Jenkins server and add credentials:
  - `docker-registry` Jenkins credentials (username/password)
  - `kubeconfig` Jenkins credentials (file containing kubeconfig)
- Create a pipeline pointing to this repo to automatically build, push, and deploy.

Kubernetes
- Apply the manifests in `k8s/`:
  - kubectl apply -f k8s/secret.yaml
  - kubectl apply -f k8s/pvc.yaml
  - kubectl apply -f k8s/mysql-deployment.yaml
  - kubectl apply -f k8s/mysql-service.yaml
  - kubectl apply -f k8s/wordpress-deployment.yaml
  - kubectl apply -f k8s/wordpress-service.yaml
  - (Optional) kubectl apply -f k8s/jenkins-deployment.yaml

Notes
- Replace placeholders (image registry, secrets) before using in production.
- Keep secrets out of source control and use your cluster's secret-management for production.
- This is minimal and intended for demonstration / starting point.
>>>>>>> 02c1be0 (Add wordpress app)
