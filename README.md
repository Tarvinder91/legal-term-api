# legal-term-api

An HTTP API for legal terms.

## Endpoints

* `GET /terms`: list all available terms.
* `GET /definitions?term=<term>`: get the definition of a term.

---

## 🚀 CI/CD Pipeline

This project uses **GitHub Actions** for automated build, test, Docker image creation, and Kubernetes deployment.

### ✅ Pipeline Triggers

| Trigger                            | Actions Run                                                  |
|------------------------------------|--------------------------------------------------------------|
| **Every commit (any branch)**      | Runs tests and Docker image build and push       |
| **PR merged into `Devdeploy`**     | Build, push image, deploy to Kubernetes namespace `dev`     |
| **PR merged into `Fitdeploy`**     | Build, push image, deploy to Kubernetes namespace `fit`     |
| **PR merged into `main`**          | Build, push image, deploy to Kubernetes namespace `prod`    |

---

## 🛠 Requirements

Configure the below secrets:

| Secret Name         | Description                                  |
|---------------------|----------------------------------------------|
| `DOCKER_USERNAME`   | Docker registry username                      |
| `DOCKER_PASSWORD`   | Docker registry password or access token      |
| `KUBECONFIG_BASE64` | Base64-encoded `kubeconfig` file              |
