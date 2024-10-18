#!/bin/bash

# Step 1: Build the Docker image
docker build --platform linux/amd64 -t ubuntu_20_04_amd64 .

# Step 2: Run the Docker container
docker run --platform linux/amd64 -it --mount type=bind,src=./,target=/home/v831 -p 8888:8888 ubuntu_20_04_amd64