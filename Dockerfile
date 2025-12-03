FROM python:3.12-slim

WORKDIR /app

# Install system dependencies required for pyaudio, ffmpeg, and other packages
RUN apt-get update && apt-get install -y \
    gcc \
    portaudio19-dev \
    python3-dev \
    ffmpeg \
    && rm -rf /var/lib/apt/lists/*

# Install pip and upgrade setuptools
RUN pip install --upgrade pip setuptools wheel

# Copy project files
COPY . .

# Install dependencies from requirements.txt or pyproject.toml
RUN pip install -e .

# Create .streamlit directory and add config
RUN mkdir -p ~/.streamlit
COPY .streamlit/config.toml ~/.streamlit/config.toml

EXPOSE 8501

# Add PYTHONPATH to recognize src directory
ENV PYTHONPATH=/app
ENV STREAMLIT_SERVER_HEADLESS=true
ENV STREAMLIT_SERVER_PORT=8501
ENV STREAMLIT_SERVER_ADDRESS=0.0.0.0

CMD ["streamlit", "run", "src/app.py", "--logger.level=warning"]