# Use Python 3.9 as the base image
FROM python:3.9

# Set the working directory in the container
WORKDIR /app

# Clone the TorrentSeedr repository from GitHub
RUN git clone https://github.com/hemantapkh/TorrentSeedr.git

# Change to the TorrentSeedr directory
WORKDIR /app/TorrentSeedr

# Copy the requirements.txt file into the container
COPY requirements.txt .

# Install the required Python packages
RUN pip install -r requirements.txt

# Copy the migration and main Python files into the container
COPY migrations.py .
COPY torrentseedr.py .

# Expose the port used by the application (if any)
# EXPOSE <port_number>

# Define the command to run the application
CMD ["python", "torrentseedr.py"]
