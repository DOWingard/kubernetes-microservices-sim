# Use lightweight Ubuntu
FROM ubuntu:24.04

# Install dependencies
RUN apt-get update && apt-get install -y wget gnupg2 software-properties-common curl && rm -rf /var/lib/apt/lists/*

# Install Grafana OSS
RUN wget -q -O - https://packages.grafana.com/gpg.key | apt-key add - \
    && add-apt-repository "deb https://packages.grafana.com/oss/deb stable main" \
    && apt-get update \
    && apt-get install -y grafana

# Expose Grafana port
EXPOSE 3000

# Start Grafana server
CMD ["grafana-server", "--homepath=/usr/share/grafana", "--config=/etc/grafana/grafana.ini", "--packaging=deb"]
