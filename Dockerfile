FROM ubuntu:20.04

RUN apt-get update && apt-get install software-properties-common -y && apt install curl -y
RUN add-apt-repository ppa:deadsnakes/ppa  && add-apt-repository universe

RUN apt-get update && \
    apt-get install -y git nano python3.6 python2.7 python3-pip
    
RUN curl https://bootstrap.pypa.io/get-pip.py --output get-pip.py
RUN apt-get update && apt install python2 -y && python2 get-pip.py
#RUN apt install python2 -y
#RUN python2 --version
#RUN python2 get-pip.py
#RUN pip2 --version
  
COPY . /home/threatingestor
WORKDIR /home/threatingestor
    
RUN alias python3='/usr/bin/python3.6' && alias python='/usr/bin/python2.7'
RUN pip3 install threatingestor && pip3 install threatingestor[all] && pip3 install loguru
#RUN pip install threatingestor && pip install threatingestor[all]


RUN pip3 install pymisp==2.4.119 && pip install pymisp==2.4.119
RUN alias python3='/usr/bin/python3.6'
    
ENTRYPOINT ["/bin/bash"]

