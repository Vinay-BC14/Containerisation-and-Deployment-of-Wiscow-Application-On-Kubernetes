# Use an official Kali Linux as a parent image
FROM kalilinux/kali-rolling

# Set the working directory
WORKDIR /app

# Copy the current directory to the container
COPY . /app

# Install Python and dependencies
RUN apt-get update && apt-get install -y python3 python3-pip && \
    pip3 install --no-cache-dir -r requirements.txt

# Expose port 80
EXPOSE 80

# Run the application
CMD ["python3", "app.py"]
