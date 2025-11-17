# Use lightweight Ubuntu for better compatibility
FROM ubuntu:24.04

# Install dependencies
RUN apt-get update && apt-get install -y curl unzip && rm -rf /var/lib/apt/lists/*

# Download and install ngrok
RUN curl -Lo /tmp/ngrok.zip https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip \
    && unzip /tmp/ngrok.zip -d /usr/local/bin/ \
    && rm /tmp/ngrok.zip

# Set working directory
WORKDIR /app

# Expose ngrok web interface (optional, default 4040) 
EXPOSE 4040

# Environment variables
ENV NGROK_AUTHTOKEN=""
ENV SERVICE_PORT=8080

# Start ngrok tunnel
CMD ["sh", "-c", "ngrok authtoken $NGROK_AUTHTOKEN && ngrok http $SERVICE_PORT --log=stdout"]
