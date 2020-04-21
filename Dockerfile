FROM ubuntu:latest

RUN apt update && apt install -y \
      vim \
      curl \
      make \
      build-essential \
      libsm6 \
      libv4l-dev \
      libxext6 \
      libxrandr-dev \
      python3-pip \
    && curl -sL https://deb.nodesource.com/setup_12.x | bash - \
    && apt-get -y install nodejs \
    && mkdir /.npm \
    && chmod 777 /.npm

COPY app.js /opt/
COPY package.json /opt/
COPY requirements.txt /opt/

WORKDIR /opt

RUN pip3 install --no-cache-dir -r /opt/requirements.txt

RUN npm install

COPY background.jpg /opt/
COPY fake.py /opt/
COPY run.sh /opt/

ENTRYPOINT /opt/run.sh
