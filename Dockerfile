# Use the official Ubuntu 20.04 base image
FROM ubuntu:20.04

# Set non-interactive mode to avoid prompts during package installation
ENV DEBIAN_FRONTEND=noninteractive

# Update the package list and install Python and venv module
RUN apt update && apt install -y \
    python3 \
    python3-venv \
    python3-pip \
    build-essential \
    cmake \
    git \
    sshpass \
    && apt clean

# Set the working directory inside the container
WORKDIR /home

# Create a virtual environment in the /app directory
# RUN python3 -m venv venv

# Activate the virtual environment and install rpyc_ikernel
# RUN /bin/bash -c "source venv/bin/activate && pip install rpyc_ikernel && python -m rpyc_ikernel.install"

# Expose any necessary ports (for example, if rpyc_ikernel will use one)
EXPOSE 8888

# Make sure the virtual environment is activated when the container starts
# CMD ["/bin/bash"]
# CMD ["/bin/bash", "-c", "source venv/bin/activate && jupyter notebook --ip=0.0.0.0 --port=8888 --no-browser --allow-root"]

# Make sure the virtual environment is activated and the tar command is executed when the container starts
# CMD ["/bin/bash", "-c", "source venv/bin/activate && tar -Jxvf ./v831/toolchain-sunxi-musl-pack-2021-01-09.tar.xz -C /opt && exec bash"]
CMD ["/bin/bash", "-c", "tar -Jxvf ./v831/toolchain-sunxi-musl-pack-2021-01-09.tar.xz -C /opt && exec bash"]