# Use an official CUDA runtime as a parent image
ARG pythonVersion=3.10
FROM nvidia/cuda:11.8.0-devel-ubuntu22.04

# Set environment variables
ENV LANG=C.UTF-8 LC_ALL=C.UTF-8
ENV PATH /opt/conda/bin:$PATH

RUN mkdir -p /app
# RUN mkdir /app/data
WORKDIR /app

# Install some basic dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
        curl \
        wget \ \
        git \
        libjpeg-dev \
        libpng-dev \
        python3-dev \
        python3-pip \
        python3-setuptools \
        vim \
        zip\
        unzip \
    && rm -rf /var/lib/apt/lists/*

RUN addgroup --system --gid 10000 appgrp
RUN adduser --system --home /app --shell /usr/sbin/nologin --no-create-home --disabled-password --uid 10000 --gid 10000 app

RUN mkdir -p /app
COPY ./requirements.txt /app/requirements.txt
WORKDIR /app
# Create the environment:
RUN pip install --upgrade pip
RUN pip install -r requirements.txt
EXPOSE 8080/tcp
# Download and install Miniconda
RUN wget --quiet https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O /tmp/miniconda.sh && \
    /bin/bash /tmp/miniconda.sh -b -p /opt/conda && \
    conda init

# RUN pip install --no-cache-dir opencv-python-headless
ENV TF_CPP_MIN_LOG_LEVEL=3
ENV HTTP_PORT=8080

COPY . /app
RUN rm /app/requirements.txt
RUN chown -R 10000:10000 /app
USER 10000

# Create symlink for the Akeyless mapped secrets into place where it will be accessible by the application
RUN ln -s /etc/secrets/.env /app/.env

# Retreive $.kitt.build.version
ARG kittBuildVersion
RUN echo ${kittBuildVersion} > /app/BUILD_VERSION.txt

# The code to run when container is started:
# ENTRYPOINT ["python3"]
ENTRYPOINT ["python3", "-u", "app.py"]