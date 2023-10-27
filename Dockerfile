# Use a base image with Python, Google Chrome, and ChromeDriver
FROM python:3.8-slim

# Install necessary packages (e.g., Chrome and dependencies)
RUN apt-get update && apt-get install -y \
    google-chrome-stable \
    unzip

# Install Python dependencies
RUN pip install selenium

# Download and install ChromeDriver
RUN wget -O /tmp/chromedriver.zip https://chromedriver.storage.googleapis.com/94.0.4606.61/chromedriver_linux64.zip
RUN unzip /tmp/chromedriver.zip -d /usr/local/bin/
RUN rm /tmp/chromedriver.zip

# Your additional Dockerfile instructions go here
# Copy your Selenium test script and other application files

# Set the entry point for running your Selenium tests
CMD ["robot", "Robot_File/Testcase.robot"]
