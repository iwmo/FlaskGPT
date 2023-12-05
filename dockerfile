# Use an official Python runtime as a parent image
FROM python:3.9-slim

# Install git
RUN apt-get update && apt-get install -y git

# Set the working directory in the container
WORKDIR /app

# Clone your repository
RUN git clone https://github.com/iwmo/FlaskGPT.git /app

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Make port 8000 available to the world outside this container
EXPOSE 8000

# Define environment variable
ENV OPENAI_API_KEY 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

# Run app.py when the container launches
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000"]
