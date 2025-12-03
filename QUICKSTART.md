# 🚀 Quick Start Guide - AIVA Mock Interview System

Get your application running in minutes with these simple steps.

---

## 📦 Option 1: Run Locally (Fastest for Testing)

### Prerequisites
- Python 3.12+
- OpenAI API key (or Ollama local setup)

### Steps

1. **Clone and navigate to project:**
   ```bash
   git clone https://github.com/GRUMPY-TUCKER/AI-Powered-Excel-Mock-Interviewer.git
   cd "Excel Interview"
   ```

2. **Create virtual environment:**
   ```bash
   # Windows
   python -m venv venv
   .\venv\Scripts\Activate.ps1
   
   # macOS/Linux
   python3 -m venv venv
   source venv/bin/activate
   ```

3. **Install dependencies:**
   ```bash
   pip install -r requirements.txt
   ```

4. **Create `.env` file:**
   ```bash
   cp .env.example .env
   ```
   
   Edit `.env` and add your OpenAI API key:
   ```env
   API_KEY=sk-your-openai-key-here
   BASE_URL=https://api.openai.com/v1
   MODEL_NAME=gpt-4o-mini
   TTS_SERVER_URL=http://localhost:5002
   ```

5. **Optional: Start TTS Server in a separate terminal:**
   ```bash
   docker run -d --name tts -p 5002:5002 \
     ghcr.io/coqui-ai/tts-cpu:latest \
     python3 -m TTS.server.server --model_name tts_models/en/vctk/vits --port 5002
   ```

6. **Run the app:**
   ```bash
   streamlit run src/app.py
   ```

7. **Open browser:**
   Visit **http://localhost:8501** ✨

---

## 🐳 Option 2: Run with Docker Compose (Production-Ready)

### Prerequisites
- Docker & Docker Compose installed

### Steps

1. **Clone project:**
   ```bash
   git clone https://github.com/GRUMPY-TUCKER/AI-Powered-Excel-Mock-Interviewer.git
   cd "Excel Interview"
   ```

2. **Create `.env` file:**
   ```bash
   cp .env.example .env
   ```
   
   Edit with your OpenAI API key:
   ```env
   API_KEY=sk-your-openai-key-here
   ```

3. **Start the application:**
   ```bash
   docker-compose up -d
   ```

4. **Check if everything is running:**
   ```bash
   docker-compose ps
   ```

5. **Open browser:**
   Visit **http://localhost:8501** ✨

6. **View logs (if needed):**
   ```bash
   docker-compose logs -f app
   ```

7. **Stop services:**
   ```bash
   docker-compose down
   ```

---

## ☁️ Option 3: Deploy to Cloud (Share with Anyone)

### Deploy to Render.com (Recommended - Free)

1. **Push to GitHub** (if not already):
   ```bash
   git add .
   git commit -m "Ready for deployment"
   git push origin main
   ```

2. **Go to Render.com:**
   - Sign up at https://render.com
   - Click **"New +"** → **"Web Service"**
   - Connect your GitHub repo
   - Choose name: `aiva-mock-interviews`
   - Render detects `render.yaml` automatically
   - Click **"Create Web Service"**

3. **Add API Key:**
   - In Render dashboard, go to **"Environment"**
   - Add variable: `API_KEY = sk-your-openai-key`
   - Save and redeploy

4. **Access your app:**
   Your live URL: `https://aiva-mock-interviews.onrender.com` 🎉

> **Note:** Free tier sleeps after 15 minutes. Upgrade to paid ($7+/month) to always stay awake.

---

## 🔑 Getting Your OpenAI API Key

1. Go to https://platform.openai.com
2. Sign in or create account
3. Navigate to **"API keys"**
4. Click **"Create new secret key"**
5. Copy the key and paste in `.env`

---

## 📱 Using the Application

### Interview Types

**1. CV-Based Interview**
- Upload your CV (PDF)
- AI asks personalized questions about your experience
- Get tailored feedback

**2. Technical Interview**
- Practice AI/ML technical questions
- Interactive voice-based interview
- Comprehensive evaluation report

### Features

✅ Voice-based Q&A  
✅ AI-generated questions  
✅ Automatic transcription  
✅ Evaluation reports  
✅ Downloadable feedback  

---

## 🆘 Troubleshooting

### Problem: "Connection refused" at localhost:8501
**Solution:**
```bash
# Make sure app is running
streamlit run src/app.py

# Or check docker
docker-compose ps
```

### Problem: "API Key Invalid"
**Solution:**
- Verify API key in `.env` is correct
- Check it has no extra spaces
- Ensure you have OpenAI credits

### Problem: "TTS Server not responding"
**Solution:**
```bash
# Restart TTS container
docker-compose restart tts

# Or manually run
docker run -d -p 5002:5002 ghcr.io/coqui-ai/tts-cpu:latest
```

### Problem: Microphone doesn't work
**Solution:**
- Allow browser microphone permissions
- Try a different browser
- Check system audio settings

---

## 📚 Full Documentation

For advanced setup, deployment options, and troubleshooting:
👉 See **[DEPLOYMENT.md](./DEPLOYMENT.md)**

---

## 🎯 Next Steps

1. ✅ Run locally and test
2. ✅ Deploy to Render/Railway for sharing
3. ✅ Collect user feedback
4. ✅ Iterate and improve

---

## 💬 Need Help?

- **Issues**: https://github.com/GRUMPY-TUCKER/AI-Powered-Excel-Mock-Interviewer/issues
- **Email**: [Your contact info]

**Happy interviewing! 🚀**
