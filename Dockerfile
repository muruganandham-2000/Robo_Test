# Use a base image with Ubuntu
FROM ubuntu:22.04

# Install necessary packages and dependencies
RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y --no-install-recommends \
    python3.11 \
    wget \
    unzip \
    python3-pip \
    && rm -rf /var/lib/apt/lists/*

# Download and install ChromeDriver to the current directory
RUN wget -N https://edgedl.me.gvt1.com/edgedl/chrome/chrome-for-testing/118.0.5993.70/linux64/chromedriver-linux64.zip -P /usr/local/bin/ && \
    unzip /usr/local/bin/chromedriver-linux64.zip -d /app/ && \
    chmod +x /usr/local/bin/chromedriver-linux64/chromedriver && \
    rm /usr/local/bin/chromedriver-linux64.zip


# Set the working directory inside the container
WORKDIR /app

# Copy the contents of the current directory and install Python dependencies
COPY ./ /app/
RUN pip install -r /app/Requirements.txt

# Set the entry point for running your Selenium tests
CMD ["robot", "Robot_File/Testcase.robot"]
