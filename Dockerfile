FROM ubuntu:22.04

# Copy the Chrome .deb file into the Docker image
COPY google-chrome-stable_119.0.6045.160_amd64.deb /tmp/

# Install necessary packages
RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y --no-install-recommends \
    /tmp/google-chrome-stable_119.0.6045.160_amd64.deb \
    python3.11 \
    python3-pip && \
    rm -rf /var/lib/apt/lists/*

# Set the working directory inside the container
WORKDIR /app

# Copy the contents of the current directory into the container
COPY ./ /app/
RUN pip install -r /app/Requirements.txt

# Set the entry point for running your Selenium tests
CMD ["robot", "Robot_File/Testcase.robot"]
