# Use lightweight Ubuntu
FROM ubuntu:24.04

# Install dependencies
RUN apt-get update && apt-get install -y curl unzip gnupg && rm -rf /var/lib/apt/lists/*

# Install latest ngrok (v3+) from official repository
RUN curl -s https://ngrok-agent.s3.amazonaws.com/ngrok.asc | tee /etc/apt/trusted.gpg.d/ngrok.asc >/dev/null \
    && echo "deb https://ngrok-agent.s3.amazonaws.com buster main" | tee /etc/apt/sources.list.d/ngrok.list \
    && apt-get update \
    && apt-get install -y ngrok

# Set working directory
WORKDIR /app

# Expose ngrok’s local web UI (optional)
EXPOSE 4040

# Environment variables (Railway will override these)
ENV NGROK_AUTHTOKEN=""
ENV SERVICE_PORT=3000

# Start ngrok tunnel
CMD sh -c "ngrok authtoken $NGROK_AUTHTOKEN && ngrok http $SERVICE_PORT --log=stdout"
