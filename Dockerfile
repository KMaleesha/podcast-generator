FROM ubuntu:latest

# Install required packages
RUN apt-get update && apt-get install -y \
    python3.10 \
    python3-pip \
    git

# Install Python packages
RUN pip3 install PyYAML

# Copy the Python script and the entrypoint script
COPY feed.py /usr/bin/feed.py
COPY entrypoint.sh /entrypoint.sh

# Ensure the entrypoint script has executable permissions
RUN chmod +x /entrypoint.sh

# Set the entrypoint
ENTRYPOINT ["/entrypoint.sh"]
