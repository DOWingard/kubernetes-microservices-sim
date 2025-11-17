# Use lightweight Ubuntu
FROM ubuntu:24.04

# Install dependencies
RUN apt-get update && apt-get install -y wget gnupg2 software-properties-common curl && rm -rf /var/lib/apt/lists/*

# Install Grafana OSS
RUN wget -q -O - https://packages.grafana.com/gpg.key | apt-key add - \
    && add-apt-repository "deb https://packages.grafana.com/oss/deb stable main" \
    && apt-get update \
    && apt-get install -y grafana

# Create persistent data directory
RUN mkdir -p /var/lib/grafana

# Expose Grafana port
EXPOSE 3000

# Environment variables for admin login (can be overridden in Railway dashboard)
ENV GF_SECURITY_ADMIN_USER=admin
ENV GF_SECURITY_ADMIN_PASSWORD=drdroidassignment
ENV GF_PATHS_DATA=/var/lib/grafana
ENV GF_SERVER_HTTP_PORT=3000

# Start Grafana in foreground
CMD ["grafana-server", "--homepath=/usr/share/grafana", "--config=/etc/grafana/grafana.ini", "--packaging=deb", "--console", "foreground"]
