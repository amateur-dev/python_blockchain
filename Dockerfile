FROM ubuntu
WORKDIR /home
COPY . .
RUN apt update \
    && DEBIAN_FRONTEND=noninteractive apt upgrade -y
RUN apt install sudo -y
RUN sudo apt install software-properties-common -y
RUN sudo add-apt-repository ppa:deadsnakes/ppa -y
RUN sudo apt install python3.7 -y
RUN sudo apt install python3-pip -y
RUN alias pip=pip3
RUN alias python=python3
RUN pip install --upgrade pip
RUN pip3 install -r requirements.txt
CMD tail -f /dev/null