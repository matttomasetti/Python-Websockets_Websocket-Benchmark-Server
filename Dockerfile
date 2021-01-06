FROM ubuntu

# Set timezone and environment variables
ENV TZ=America/New_York
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Add source files to docker image
ADD .	/home/websocket

# Update and install dependencies
RUN apt-get -y update \
    && apt-get -y upgrade \
    && apt-get -y install git python3-pip

# Install project requirements
RUN cd /home/websocket \
    && pip3 install -r requirements.txt

    
EXPOSE 8080

WORKDIR /home/websocket
CMD ["python3", "python-websockets_websocket-benchmark-client.py"]
