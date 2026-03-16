# 🚀 AI News Assistant — DevOps Portfolio Project

> **End-to-End CI/CD Pipeline** | Docker · GitHub Actions · DockerHub

[![CI/CD Pipeline](https://github.com/YuvarajOfl/ai-news-assistant-devops/actions/workflows/ci-cd.yml/badge.svg)](https://github.com/YuvarajOfl/ai-news-assistant-devops/actions/workflows/ci-cd.yml)
[![Docker Pulls](https://img.shields.io/docker/pulls/YOUR_DOCKERHUB_USERNAME/ai-news-assistant)](https://hub.docker.com/r/YOUR_DOCKERHUB_USERNAME/ai-news-assistant)
[![Docker Image Size](https://img.shields.io/docker/image-size/YOUR_DOCKERHUB_USERNAME/ai-news-assistant/latest)](https://hub.docker.com/r/YOUR_DOCKERHUB_USERNAME/ai-news-assistant)
[![Python](https://img.shields.io/badge/python-3.11-blue?logo=python)](https://www.python.org/)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

---

## 📋 Project Overview

This project demonstrates a **production-style DevOps workflow** built around a real Python/Streamlit application — [AI News Assistant](https://github.com/YuvarajOfl/ai-news-assistant) — a real-time news aggregator with AI-powered summaries and sentiment analysis.

The focus of **this** repository is not the application itself, but the **DevOps infrastructure** around it:

| What's demonstrated | Tools used |
|---|---|
| Source control & branching | GitHub |
| Automated testing & linting | GitHub Actions + flake8 |
| Containerisation | Docker (multi-stage build) |
| Image registry | DockerHub |
| Full CI/CD pipeline | GitHub Actions |
| Security best practices | Non-root container user, secrets management |

**Live application:** https://ai-news-assistant.streamlit.app/

---

## 🏗️ Architecture

```
Developer → GitHub → GitHub Actions → DockerHub → Any Server
```

![CI/CD Architecture](docs/architecture.svg)

Every `git push` to `main`:
1. Triggers the GitHub Actions workflow automatically
2. Installs Python dependencies and runs linting
3. Builds a Docker image using a multi-stage Dockerfile
4. Logs in to DockerHub using encrypted GitHub Secrets
5. Pushes two tags: `:latest` and `:sha-<commit>`

---

## 📁 Project Structure

```
ai-news-assistant-devops/
│
├── .github/
│   └── workflows/
│       └── ci-cd.yml          # GitHub Actions CI/CD pipeline
│
├── app/                       # Application source code (copied from original repo)
│   ├── app.py                 # Streamlit entry point
│   └── ...                    # Other application files
│
├── docs/
│   └── architecture.svg       # CI/CD architecture diagram
│
├── Dockerfile                 # Multi-stage Docker build
├── .dockerignore              # Files excluded from Docker build context
├── requirements.txt           # Python dependencies
└── README.md                  # This file
```

---

## 🔄 CI/CD Pipeline — Step by Step

The pipeline is defined in `.github/workflows/ci-cd.yml` and consists of **3 jobs**:

```
┌──────────────────────────────────────────────────────────────┐
│  Trigger: git push to main                                   │
└──────────────────┬───────────────────────────────────────────┘
                   │
         ┌─────────▼──────────┐
         │  JOB 1: test        │  ← Checkout → Install deps → Lint (flake8)
         └─────────┬──────────┘
                   │ (only if tests pass)
         ┌─────────▼──────────┐
         │  JOB 2: build-push  │  ← Docker Buildx → Login → Build → Push
         └─────────┬──────────┘
                   │
         ┌─────────▼──────────┐
         │  JOB 3: summary     │  ← Write pipeline report to GitHub UI
         └────────────────────┘
```

### Docker Image Tags

| Tag | Description |
|---|---|
| `latest` | Always points to the latest build from `main` |
| `sha-abc1234` | Immutable tag tied to a specific git commit |

---

## 🛠️ Technologies Used

| Technology | Role |
|---|---|
| **Python 3.11** | Application runtime |
| **Streamlit** | Web framework for the application |
| **Docker** | Containerisation (multi-stage build) |
| **DockerHub** | Public container image registry |
| **GitHub Actions** | CI/CD automation |
| **flake8** | Python linting |
| **Docker Buildx** | Advanced image builder with layer caching |

---

## ⚙️ Setup Instructions

### Prerequisites

- [Git](https://git-scm.com/)
- [Docker Desktop](https://www.docker.com/products/docker-desktop/)
- A [GitHub](https://github.com) account
- A [DockerHub](https://hub.docker.com) account

---

### Step 1 — Copy Application Code

```bash
# Clone the original application repository
git clone https://github.com/YuvarajOfl/ai-news-assistant.git

# Clone this DevOps repository
git clone https://github.com/YuvarajOfl/ai-news-assistant-devops.git

# Copy application files into the DevOps repo
cp -r ai-news-assistant/* ai-news-assistant-devops/app/
cp ai-news-assistant/requirements.txt ai-news-assistant-devops/requirements.txt

cd ai-news-assistant-devops
```

---

### Step 2 — Create DockerHub Access Token

1. Log in to [hub.docker.com](https://hub.docker.com)
2. Click your profile → **Account Settings** → **Security**
3. Click **New Access Token**
4. Name it `github-actions` → Permission: **Read, Write, Delete**
5. **Copy the token** (you won't see it again)

---

### Step 3 — Add GitHub Secrets

1. Go to your DevOps repository on GitHub
2. Click **Settings** → **Secrets and variables** → **Actions**
3. Click **New repository secret** — add both:

| Secret Name | Value |
|---|---|
| `DOCKERHUB_USERNAME` | Your DockerHub username |
| `DOCKERHUB_TOKEN` | The access token from Step 2 |

---

### Step 4 — Push to GitHub (triggers the pipeline)

```bash
git add .
git commit -m "feat: add CI/CD pipeline with Docker"
git push origin main
```

Watch the pipeline run at: `https://github.com/YuvarajOfl/ai-news-assistant-devops/actions`

---

### Step 5 — Test Docker Container Locally

```bash
# Build the image locally
docker build -t ai-news-assistant:local .

# Run the container (replace with your actual API keys)
docker run -p 8501:8501 \
  -e NEWS_API_KEY=your_api_key_here \
  ai-news-assistant:local

# Open in browser
# → http://localhost:8501
```

```bash
# Or pull the published image directly from DockerHub
docker pull YOUR_DOCKERHUB_USERNAME/ai-news-assistant:latest
docker run -p 8501:8501 YOUR_DOCKERHUB_USERNAME/ai-news-assistant:latest
```

---

## 🔒 Security Practices Applied

- **No secrets in code** — API keys and credentials are passed as environment variables, never hardcoded
- **GitHub Secrets** — DockerHub credentials are encrypted and never exposed in logs
- **Non-root container** — The app runs as a dedicated `appuser` (UID 1000), not as root
- **Multi-stage build** — Build tools are discarded; only the runtime image is shipped
- **`.dockerignore`** — Prevents `.env` files, secrets, and dev files from entering the image
- **Immutable image tags** — Every image is tagged with its git commit SHA for full traceability

---

## 📊 Pipeline in Action

```
$ git push origin main

[GitHub] Push received on branch: main
[Actions] Workflow triggered: ci-cd.yml

  ✅ JOB 1 — Lint & Test
     → Checkout repository         ✓
     → Setup Python 3.11           ✓
     → Install dependencies        ✓
     → flake8 lint (syntax)        ✓

  ✅ JOB 2 — Build & Push
     → Setup Docker Buildx         ✓
     → Login to DockerHub          ✓
     → Build Docker image          ✓
     → Push :latest                ✓
     → Push :sha-a1b2c3d           ✓

  ✅ JOB 3 — Summary
     → Pipeline report written     ✓

[DockerHub] New image available: username/ai-news-assistant:latest
```

---

## 🤝 Related Repositories

- **Application Repo:** [ai-news-assistant](https://github.com/YuvarajOfl/ai-news-assistant) — Source code of the Streamlit app
- **DevOps Repo:** [ai-news-assistant-devops](https://github.com/YuvarajOfl/ai-news-assistant-devops) — This repository

---

## 📄 License

This project is licensed under the [MIT License](LICENSE).

---

*Built as a DevOps portfolio project to demonstrate CI/CD, Docker, and GitHub Actions best practices.*
