# Use the official Python image from the Docker Hub
FROM python:3.11-slim

# Set the working directory
WORKDIR /app

# Copy the requirements.txt file and install dependencies
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

# Copy the Flask app code into the container
COPY app.py ./

# Expose port 8080 (Cloud Run expects your app to listen on this port)
EXPOSE 8080

# Command to run the app
CMD ["python", "app.py"]
