FROM maven 
RUN  apt-get update && apt-get -y install fortune
RUN  ln -s /usr/
CMD tail -f /dev/null