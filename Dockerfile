# Use Alpine Linux as the base image
FROM alpine:latest

# Update the package repository and install Python3 and pip
RUN apk update && apk add python3 py3-pip

# Copy your Python application to the container
COPY ./src/app.py /app.py

# Install Flask using pip and remove unnecessary packages
RUN pip3 install flask && \
    apk del py3-pip && \
    rm -rf /var/cache/apk/*

# Set the working directory
WORKDIR /

# Expose the port your Flask application will listen on
EXPOSE 5000

# Start your application
CMD ["python3", "app.py"]