FROM python:3.9-slim

# Set working directory
WORKDIR /app

# Copy requirements file
COPY requirements.txt .

# Install dependencies
RUN pip install -r requirements.txt

# Copy application code
COPY . .

# Expose port 8080
#EXPOSE 8080

# Use environment variable PORT, with a fallback to 8080 if not defined
#ENV PORT 8080

# Run the application, using the PORT environment variable set by Cloud Run
app.run(port=int(os.environ.get("PORT", 8080)),host='0.0.0.0',debug=True)
CMD ["flask", "run", "--host=0.0.0.0", "--port=8080"]

