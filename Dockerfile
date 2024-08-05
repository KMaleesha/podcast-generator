FROM ubuntu:latest

# Install Python, pip, and virtual environment tools
RUN apt-get update && apt-get install -y \
    python3.10 \
    python3-pip \
    python3-venv \
    git \
 && apt-get clean

# Create and activate a virtual environment, then install PyYAML
RUN python3 -m venv /opt/venv
RUN /opt/venv/bin/pip install --no-cache-dir PyYAML

# Copy the Python script and the entrypoint script
COPY feed.py /usr/bin/feed.py
COPY entrypoint.sh /entrypoint.sh

# Ensure the entrypoint script has executable permissions
RUN chmod +x /entrypoint.sh

# Set the entrypoint and activate the virtual environment
ENTRYPOINT ["/opt/venv/bin/python", "/entrypoint.sh"]
