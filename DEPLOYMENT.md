# 🚀 Complete Deployment Guide - AIVA Mock Interviews

This guide covers three deployment methods:
1. **Local Development** (with localhost)
2. **Docker & Docker Compose** (self-hosted)
3. **Cloud Deployment** (Render.com or Railway.app)

---

## ✅ Prerequisites

- Python 3.12+
- Docker & Docker Compose (for containerized deployment)
- OpenAI API key or local Ollama setup
- Git

---

## 📋 Part 1: Local Development Setup

### 1.1 Clone the Repository

```bash
git clone https://github.com/GRUMPY-TUCKER/AI-Powered-Excel-Mock-Interviewer.git
cd "Excel Interview"
```

### 1.2 Create Virtual Environment

**Windows (PowerShell):**
```powershell
python -m venv venv
.\venv\Scripts\Activate.ps1
```

**macOS/Linux:**
```bash
python3 -m venv venv
source venv/bin/activate
```

### 1.3 Install Dependencies

```bash
pip install --upgrade pip
pip install -r requirements.txt
```

Or with pyproject.toml:
```bash
pip install -e .
```

### 1.4 Configure Environment Variables

Create a `.env` file from the example:

```bash
cp .env.example .env
```

Edit `.env` with your settings:

```env
# Option A: Using OpenAI API (Recommended for Production)
API_KEY=sk-your-openai-key-here
BASE_URL=https://api.openai.com/v1
MODEL_NAME=gpt-4o-mini
TTS_SERVER_URL=http://localhost:5002

# Option B: Using Ollama Locally
API_KEY=ollama
BASE_URL=http://localhost:11434/v1
MODEL_NAME=llama2
TTS_SERVER_URL=http://localhost:5002
```

### 1.5 Set Up Text-to-Speech Server (Optional for Local)

**Using Docker (Recommended):**
```bash
docker run -d --name tts-server -p 5002:5002 \
  ghcr.io/coqui-ai/tts-cpu:latest \
  python3 -m TTS.server.server --model_name tts_models/en/vctk/vits --port 5002
```

**Or skip TTS and modify `src/app.py` to comment out audio playback.**

### 1.6 Run the Application

```bash
streamlit run src/app.py
```

Access at: **http://localhost:8501**

---

## 🐳 Part 2: Docker Compose (Recommended for Self-Hosting)

### 2.1 Prerequisites

- Docker installed ([Download Docker Desktop](https://www.docker.com/products/docker-desktop))
- `.env` file configured with your API keys

### 2.2 Build and Run with Docker Compose

**Windows (PowerShell):**
```powershell
# Copy and configure .env
Copy-Item .env.example .env
# Edit .env with your API keys
notepad .env

# Start the services
docker-compose up -d

# View logs
docker-compose logs -f app

# Stop services
docker-compose down
```

**macOS/Linux:**
```bash
cp .env.example .env
nano .env  # Edit with your API keys

docker-compose up -d
docker-compose logs -f app
```

**Access at:** http://localhost:8501

### 2.3 Useful Docker Commands

```bash
# View running containers
docker-compose ps

# View logs
docker-compose logs app
docker-compose logs tts

# Rebuild image
docker-compose build --no-cache

# Stop services
docker-compose stop

# Remove everything
docker-compose down -v
```

### 2.4 Manual Docker Build (If not using compose)

```bash
# Build the image
docker build -t aiva-mock-interviews .

# Run the container
docker run -d \
  -p 8501:8501 \
  -e API_KEY=sk-your-key \
  -e BASE_URL=https://api.openai.com/v1 \
  -e MODEL_NAME=gpt-4o-mini \
  -e TTS_SERVER_URL=http://host.docker.internal:5002 \
  aiva-mock-interviews
```

---

## ☁️ Part 3: Cloud Deployment

### Option A: Deploy to Render.com (Recommended)

#### Step 1: Prepare Repository

Ensure your GitHub repository has:
- `Dockerfile`
- `requirements.txt` (or `pyproject.toml`)
- `.env.example`
- All source code

#### Step 2: Create `render.yaml`

Create a `render.yaml` file in the root directory (already included):

```yaml
services:
  - type: web
    name: aiva-mock-interviews
    runtime: docker
    dockerfilePath: ./Dockerfile
    port: 8501
```

#### Step 3: Deploy to Render

1. Go to [render.com](https://render.com)
2. Sign in with GitHub account
3. Click **"New +"** → **"Web Service"**
4. Connect your GitHub repo
5. Choose name: `aiva-mock-interviews`
6. Set Runtime: **Docker**
7. Render will auto-detect `render.yaml`
8. Add environment variable:
   - `API_KEY`: Your OpenAI API key
9. Click **"Create Web Service"**

**Your app will be live at:** `https://aiva-mock-interviews.onrender.com`

#### Important Notes:
- Free tier services sleep after 15 minutes of inactivity
- Upgrade to paid for production use
- TTS might timeout on free tier; consider using a hosted TTS API

---

### Option B: Deploy to Railway.app

#### Step 1: Deploy

1. Install [Railway CLI](https://docs.railway.app/develop/cli)
2. Log in: `railway login`
3. Initialize project:
   ```bash
   railway init
   ```
4. Add environment variables:
   ```bash
   railway variables set API_KEY=sk-your-key
   railway variables set BASE_URL=https://api.openai.com/v1
   railway variables set MODEL_NAME=gpt-4o-mini
   ```
5. Deploy:
   ```bash
   railway up
   ```

**Your app will be live at:** `https://railway-app-name.railway.app`

---

### Option C: Deploy to Hugging Face Spaces

1. Create a new Space at [huggingface.co/spaces](https://huggingface.co/spaces)
2. Choose **Docker** as the runtime
3. Upload your repository
4. Add secrets in Space settings:
   - `API_KEY`
   - `BASE_URL`
   - `MODEL_NAME`
5. Push your code and it auto-deploys

---

## 🔒 Security Best Practices

### 1. Environment Variables
- **Never commit `.env`** to Git
- Use `.gitignore`:
  ```
  .env
  .env.local
  __pycache__/
  *.pyc
  ```

### 2. API Keys
- Use strong, unique API keys
- Rotate keys periodically
- Use service-specific API keys (not master keys)
- Set API key spending limits in OpenAI dashboard

### 3. Docker Security
- Use specific image versions (not `latest`)
- Run containers as non-root user
- Use `.dockerignore` to exclude sensitive files

### 4. Cloud Deployment
- Enable HTTPS (auto on Render/Railway)
- Set environment variables via platform dashboard, not `.env`
- Monitor usage and set spending alerts
- Use secrets management for API keys

---

## 📊 Monitoring & Logs

### Local Docker Logs
```bash
docker-compose logs -f app
```

### Render.com
- Go to your Service → **Logs** tab
- View real-time streaming logs

### Railway.app
```bash
railway logs
```

### Streamlit Specific
- Add to `src/app.py`:
  ```python
  import logging
  logging.basicConfig(level=logging.INFO)
  logger = logging.getLogger(__name__)
  logger.info("App started")
  ```

---

## 🆘 Troubleshooting

### Issue: "TTS Server Connection Failed"
**Solution:**
- Ensure TTS container is running: `docker-compose ps`
- Check TTS logs: `docker-compose logs tts`
- Verify `TTS_SERVER_URL` in `.env`

### Issue: "API Key Invalid"
**Solution:**
- Verify API key is correct in `.env`
- Check API key hasn't expired
- Ensure correct base URL for your LLM provider

### Issue: Microphone Not Working
**Solution:**
- Browser permissions: Allow microphone access
- Linux users: Install `pulseaudio`: `sudo apt-get install pulseaudio`
- Check if another app is using microphone

### Issue: Container Won't Start
**Solution:**
```bash
# Check image exists
docker images

# Build fresh
docker-compose build --no-cache

# Start with verbose output
docker-compose up app
```

### Issue: Port Already in Use
**Solution:**
```powershell
# Windows - Find process on port 8501
netstat -ano | findstr :8501
taskkill /PID <PID> /F

# Or use different port
docker-compose -p alternative_port up -d
```

---

## 📈 Performance Optimization

### For Production:
1. **Use CDN** for static assets
2. **Disable statistics** in `config.toml`:
   ```toml
   [browser]
   gatherUsageStats = false
   ```
3. **Use caching** for API responses
4. **Limit concurrent users** based on API quota
5. **Use smaller TTS model** or hosted TTS API

### Resource Requirements:
- **CPU**: 1-2 cores minimum
- **RAM**: 2-4 GB minimum
- **Storage**: 5-10 GB (includes TTS model)

---

## 🔄 CI/CD Pipeline (Optional)

### GitHub Actions Example

Create `.github/workflows/deploy.yml` (already included):

```yaml
name: Deploy to Render

on:
  push:
    branches: [main]

jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - name: Deploy to Render
        run: |
          curl -X POST https://api.render.com/deploy/srv-${{ secrets.RENDER_SERVICE_ID }}?key=${{ secrets.RENDER_API_KEY }}
```

---

## 📞 Support & Resources

- **Issues**: [GitHub Issues](https://github.com/GRUMPY-TUCKER/AI-Powered-Excel-Mock-Interviewer/issues)
- **Streamlit Docs**: https://docs.streamlit.io
- **Docker Docs**: https://docs.docker.com
- **Render Docs**: https://render.com/docs
- **Railway Docs**: https://docs.railway.app

---

## ✨ Quick Reference

| Method | Command | Access URL | Cost |
|--------|---------|-----------|------|
| Local Dev | `streamlit run src/app.py` | http://localhost:8501 | Free |
| Docker Compose | `docker-compose up -d` | http://localhost:8501 | Free |
| Render (Free) | Push to GitHub | https://app-name.onrender.com | Free (sleeps) |
| Render (Paid) | Push to GitHub | https://app-name.onrender.com | $7-40/month |
| Railway | `railway up` | https://app-name.railway.app | Pay-per-use |
| Hugging Face Spaces | Web upload | https://huggingface.co/spaces/... | Free |

---

## 🎉 You're All Set!

Your AIVA Mock Interview system is ready to deploy. Choose your preferred deployment method and start sharing with users!
