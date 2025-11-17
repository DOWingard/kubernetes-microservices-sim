# Use lightweight Ubuntu
FROM ubuntu:24.04

# Install dependencies
RUN apt-get update && apt-get install -y wget gnupg2 software-properties-common curl && rm -rf /var/lib/apt/lists/*

# Install Grafana OSS
RUN wget -q -O - https://packages.grafana.com/gpg.key | apt-key add - \
    && add-apt-repository "deb https://packages.grafana.com/oss/deb stable main" \
    && apt-get update \
    && apt-get install -y grafana

# Create a directory for persistent data
RUN mkdir -p /var/lib/grafana

# Expose Grafana port
EXPOSE 3000

# Set Grafana to run in foreground (so container stays alive)
CMD ["grafana-server", "--homepath=/usr/share/grafana", "--config=/etc/grafana/grafana.ini", "--packaging=deb", "--pidfile=/var/run/grafana.pid", "--console", "foreground"]
