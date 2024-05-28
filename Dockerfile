# Use the official Python image from the Docker Hub
FROM python:3.9-slim

# Set the working directory
WORKDIR /app

# Copy the requirements file
COPY code/requirements.txt /app/requirements.txt

# Install the dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Install OpenCV and other dependencies
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    libsm6 \
    libxext6 \
    libxrender-dev \
    libgl1-mesa-glx \
    libglib2.0-0 \
    libglib2.0-dev \
    libgstreamer1.0-0 \
    libgstreamer-plugins-base1.0-0 \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Install pillow-heif for handling HEIC images
RUN pip install pillow-heif

# Copy the rest of the application code
COPY . /app

# Command to run your script (adjust as needed)
#CMD ["python", "code/read_palm.py", "--input", "S__5283843.jpg"]
#CMD ["sh", "-c", "cd code && python read_palm.py --input S__5283843.jpg"]
CMD ["sh", "-c", "cd code && python read_palm.py --input input/S__5283843.jpg"]
