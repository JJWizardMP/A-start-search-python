# # Use Ubuntu as the base image
# FROM ubuntu:latest

# # Install Python 3.10
# RUN apt update && \
#     apt install -y libgl1 libglib2.0-0 && \
#     apt install -y python3.10 python3.10-venv python3-pip

# # Set the working directory in the container
# WORKDIR /usr/src/app

# # Create a virtual environment in the container
# RUN python3 -m venv venv

# # Activate the virtual environment
# ENV PATH="/usr/src/app/venv/bin:$PATH"

# # Copy the current directory contents into the container at /usr/src/app
# COPY . .

# # Install any needed packages specified in requirements.txt
# RUN ./venv/bin/pip install --no-cache-dir -r requirements.txt
# # RUN ./venv/bin/pip install numpy matplotlib jupyterlab opencv-python

# # Make port 80 available to the world outside this container
# EXPOSE 8888

# # Run your application when the container launches
# # CMD ["python3", "your_script.py"]
# # CMD ["jupyter", "lab", "--ip", "0.0.0.0", "--allow-root", "--no-browser"]
# CMD ["venv/bin/jupyter", "lab", "--ip", "0.0.0.0", "--allow-root", "--no-browser"]

FROM jupyter/base-notebook:python-3.10

# Copy the requirements.txt file
COPY requirements.txt /tmp/

# Install dependencies
RUN pip install --no-cache-dir -r /tmp/requirements.txt

# Copy your project files into the Docker image
COPY . /usr/src/app

# Set the working directory to where your project is copied
WORKDIR /usr/src/app