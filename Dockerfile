FROM ubuntu:latest

# Install required packages, including build-essential for compiling packages
RUN apt-get update && apt-get install -y \
    python3.10 \
    python3-pip \
    git \
    build-essential \
 && apt-get clean

# Install Python packages
RUN pip3 install --no-cache-dir PyYAML

# Copy the Python script and the entrypoint script
COPY feed.py /usr/bin/feed.py
COPY entrypoint.sh /entrypoint.sh

# Ensure the entrypoint script has executable permissions
RUN chmod +x /entrypoint.sh

# Set the entrypoint
ENTRYPOINT ["/entrypoint.sh"]
