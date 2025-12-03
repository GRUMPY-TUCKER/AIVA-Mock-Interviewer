### AI-Powered Excel Mock Interviewer 🏆

1. **The Business Context (The 'Why')**
2. **Your Role & Mission (Persona)**
3. **Core Requirements, Deliverables, and Constraints**

---

# AIVA Mock Interviews

![image (1)](https://github.com/user-attachments/assets/de5ac8dd-d887-49cb-8948-60ed28dd5c95)

This application provides mock interviews with AI-generated questions and evaluations, helping candidates prepare for technical, Excel-based, and CV-based job interviews in the AI and business domains.

---

## 🚀 Business Context – The "Why"

Our company is rapidly expanding its **Finance, Operations, and Data Analytics** divisions. A key skill for all new hires is **advanced proficiency in Microsoft Excel**.

However, our current **screening process is a bottleneck**:

* Manual technical interviews for Excel consume too much time from senior analysts
* Evaluations are inconsistent
* The hiring pipeline slows down, impacting growth targets

We believe an **AI-driven solution** can streamline this process by simulating interviews, evaluating candidates objectively, and delivering consistent, scalable assessments.

---

## 👤 Your Role & Mission – The Persona

You are the **founding AI Product Engineer** for this initiative.

Your mission:

* **Design the strategy** for an automated Excel-interviewing system
* **Build the platform** that conducts structured interviews, evaluates responses, and generates constructive feedback

This role is **hybrid**:

* As a **Product Manager**, you define the vision, user experience, and success metrics
* As an **AI Engineer**, you design and implement the technical solution

We leave the solution space **open-ended**. A conversational AI is one approach, but you’re encouraged to innovate and propose the **best possible solution**, even if it differs.

---

## 🛠 Core Requirements

1. **Structured Interview Flow**

   * The AI agent must manage a coherent, multi-turn interview
   * Introduce itself, explain the process, ask questions, summarize at the end

2. **Intelligent Answer Evaluation**

   * Core challenge: Assess candidate responses, especially Excel-related reasoning
   * Evaluate accuracy, clarity, and problem-solving

3. **Agentic Behavior & State Management**

   * AI should behave like a real interviewer
   * Keep track of context, follow up when necessary, adapt question depth

4. **Constructive Feedback Report**

   * Generate a **performance summary**
   * Highlight strengths, weaknesses, and next steps

---

## 📦 Expected Deliverables

1. **Design Document & Approach Strategy**

   * Justify technology stack, architecture, and evaluation methods

2. **Working Proof-of-Concept (PoC)**

   * Complete, runnable source code in a shared repo
   * Deployed link to access the Mock Interviewer
   * Sample transcripts demonstrating AI’s evaluation capabilities

---

## ⚖️ Project Constraints & Real-World Ambiguities

* **Technology Stack**

  * You have full autonomy, but choices must be justified
  * Example: LLM model selection, hosting platform, frameworks

* **Cold Start Problem**

  * No pre-existing dataset of Excel interview transcripts
  * Your design must handle this limitation, e.g., bootstrapping question banks

* **Scalability & Reliability**

  * The system should handle multiple concurrent candidates
  * Deliver consistent evaluations across sessions

---

## 🏗 System Overview

AIVA (AI Virtual Assistant) Mock Interviews is a **comprehensive interview preparation platform** simulating real interview scenarios with AI. It supports:

1. **CV-Based Interviews** – Upload a CV, get personalized questions
2. **Technical/Excel Interviews** – Practice with AI/ML and Excel-based challenges

---

## 🔧 System Architecture

```
┌─────────────────┐     ┌─────────────────┐     ┌─────────────────┐
│                 │     │                 │     │                 │
│  Web Interface  │◄───►│  Backend Logic  │◄───►│   LLM Service   │
│   (Streamlit)   │     │    (Python)     │     │ (Ollama/OpenAI) │
│                 │     │                 │     │                 │
└────────┬────────┘     └────────┬────────┘     └─────────────────┘
         │                       │
         │                       │
         ▼                       ▼
┌─────────────────┐     ┌─────────────────┐
│                 │     │                 │
│  Speech Input   │     │  Text-to-Speech │
│  (Microphone)   │     │   (Coqui TTS)   │
│                 │     │                 │
└─────────────────┘     └─────────────────┘
```

* **Frontend**: Streamlit web UI
* **Backend**: Python logic for interviews and AI evaluation
* **LLM Service**: Ollama/OpenAI for dynamic question generation & evaluation
* **Speech I/O**: Google Speech Recognition + Coqui TTS for natural interactions

---

## ✨ Features

* **Excel & Technical Interviews**
* **CV-based Personalization**
* **Interactive Voice Interface** (TTS + Speech Recognition)
* **Customizable Question Banks**
* **AI-Generated Performance Evaluation**
* **Downloadable Feedback Reports**

---

## 🔄 Interview Workflow

```
┌─────────────────┐     ┌─────────────────┐     ┌─────────────────┐
│                 │     │                 │     │                 │
│  Select         │────►│  Upload CV      │────►│  Start          │
│  Interview Type │     │  (if CV-based)  │     │  Interview      │
│                 │     │                 │     │                 │
└─────────────────┘     └─────────────────┘     └────────┬────────┘
                                                         │
                                                         ▼
┌─────────────────┐     ┌─────────────────┐     ┌─────────────────┐
│                 │     │                 │     │                 │
│  Receive        │◄────│  Answer         │◄────│  Listen to      │
│  Evaluation     │     │  Questions      │     │  Questions      │
│                 │     │                 │     │                 │
└─────────────────┘     └─────────────────┘     └─────────────────┘
```

---

## ⚙️ Deployment Options

### Option 1: Manual Deployment

```bash
docker run --rm -it -p 5002:5002 --entrypoint /bin/bash ghcr.io/coqui-ai/tts-cpu
python3 TTS/server/server.py --model_name tts_models/en/vctk/vits
```

Then in another terminal:

```bash
streamlit run src/app.py
```

### Option 2: Docker Compose (Recommended)

```bash
docker-compose up -d
```

Access at: [http://localhost:8501](http://localhost:8501)

### Option 3: Cloud Deployment

**Deploy to Render.com (Free with this repo):**

1. Push code to GitHub
2. Go to https://render.com and sign in with GitHub
3. Click **"New +"** → **"Web Service"**
4. Connect your repository
5. Add `API_KEY` environment variable
6. Deploy! Your app will be live at `https://your-app.onrender.com`

**See [DEPLOYMENT.md](./DEPLOYMENT.md) for full deployment options and troubleshooting.**

---

## 🚀 Quick Start

**Easiest way to run locally:**

```bash
# 1. Clone and enter directory
git clone https://github.com/GRUMPY-TUCKER/AI-Powered-Excel-Mock-Interviewer.git
cd "Excel Interview"

# 2. Create environment
python -m venv venv
.\venv\Scripts\Activate.ps1  # Windows
# or: source venv/bin/activate  # macOS/Linux

# 3. Install dependencies
pip install -r requirements.txt

# 4. Set up environment
cp .env.example .env
# Edit .env with your OpenAI API key

# 5. Run TTS server (optional but recommended)
docker run -d -p 5002:5002 ghcr.io/coqui-ai/tts-cpu:latest

# 6. Start the app
streamlit run src/app.py
```

Visit: **http://localhost:8501** 🎉

**For detailed setup instructions, see [QUICKSTART.md](./QUICKSTART.md)**

---

## 📂 Project Structure

```
aiva_mock_interviews/
├── src/                      # Source code directory
│   ├── app.py                # Streamlit frontend application
│   └── backend.py            # Backend logic and API integrations
├── .env.example              # Example environment variables
├── docker-compose.yml        # Docker Compose configuration
├── Dockerfile                # Docker build instructions
├── interview_questions.json  # Question database for technical/Excel interviews
├── pyproject.toml            # Project dependencies and metadata
├── README.md                 # Project documentation
└── utils.py                  # Utility functions for PDF parsing, audio, etc.
```

---

## 🛠 Troubleshooting

* **TTS Server Error** – Ensure TTS container is running on port 5002
* **Microphone Issues** – Check browser permissions and hardware
* **LLM Connection Problems** – Verify Ollama server and `.env` settings

---

## 🤝 Contributing

We welcome contributions!

1. Fork the repo
2. Create a feature branch
3. Submit a PR with clear documentation and tests

---
