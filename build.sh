#!/bin/bash

# Define the Docker image name and tag
IMAGE_NAME=project
TAG="latest"

# Build the Docker image using the provided Dockerfile
docker build -t $IMAGE_NAME:$TAG .

# Display a message indicating the image has been built
echo "Docker image $IMAGE_NAME:$TAG has been built successfully."

