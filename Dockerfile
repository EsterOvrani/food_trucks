# Alpine image
FROM alpine:3.11

# Define the work area
WORKDIR /app

# Installation
RUN apk add --no-cache \
    python2 \
    py2-pip \
    nodejs \
    npm \
    bash

# Copy the files application to the container
COPY flask-app /app
COPY utils /app/utils

# Install all the libaries for the python file
RUN pip install --no-cache-dir -r /app/requirements.txt

# Add the build react file
COPY flask-app/static/build /app/static/build

# Export port 
EXPOSE 5000

# Define the flask file to run in intilization
ENTRYPOINT ["python", "/app/app.py"]

