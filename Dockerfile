# Use a base image with Python, Google Chrome, and ChromeDriver
#FROM python:3.8-slim
#FROM ubuntu:22.04
FROM selenium/standalone-chrome:latest


# Install necessary packages (e.g., Chrome and dependencies)
# RUN apt-get update && apt-get install -y \
#     google-chrome-stable \
#     unzip

RUN apt-get update && apt-get upgrade -y && \
        apt-get install -y --no-install-recommends \
        chromium-browser \
        python3.11 \
        python3-pip && \
        rm -rf /var/lib/apt/lists/*


# Install Python dependencies
#RUN pip install selenium

# Download and install ChromeDriver
# RUN wget -O /tmp/chromedriver.zip https://chromedriver.storage.googleapis.com/94.0.4606.61/chromedriver_linux64.zip
# RUN unzip /tmp/chromedriver.zip -d /usr/local/bin/
# RUN rm /tmp/chromedriver.zip

# Set the working directory inside the container
WORKDIR /app

# Copy the contents of the current directory into the container
COPY ./ /app/
RUN pip install -r /app/Requirements.txt

# Your additional Dockerfile instructions go here
# Copy your Selenium test script and other application files

# Set the entry point for running your Selenium tests
CMD ["robot", "Robot_File/Testcase.robot"]
