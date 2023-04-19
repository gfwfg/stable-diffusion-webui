FROM pytorch/pytorch:1.11.0-cuda11.3-cudnn8-runtime

# Install git
RUN apt-get update && apt-get install -y git

# Install python packages
RUN pip3 install --upgrade pip
ADD requirements.txt /tmp/requirements.txt
RUN pip3 install -r /tmp/requirements.txt --no-cache-dir

ADD . /home
WORKDIR /home

EXPOSE 8000
CMD python3 launch.py 
# python launch.py --nowebui --skip-torch-cuda-test --listen --port 8000