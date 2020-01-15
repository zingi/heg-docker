FROM debian:buster-20191224

# install system dependencies
RUN apt-get update && \
    apt-get install gnupg2 -y && \
    apt-get install wget -y && \
    apt-get install software-properties-common -y && \
    apt-get install libxext6 -y && \
    apt-get install libxrender1 -y && \
    apt-get install libxtst6 -y && \
    apt-get install xvfb -y && \
    apt-get install libfontconfig1 -y

# install java 1.8 runtime
RUN wget -O- https://apt.corretto.aws/corretto.key | apt-key add - && \
    add-apt-repository 'deb https://apt.corretto.aws stable main' && \
    apt-get update && \
    apt-get install java-1.8.0-amazon-corretto-jdk -y

# install heg
RUN mkdir /opt/heg-install && \
    mkdir /opt/heg && \
    cd /opt/heg-install && \
    wget -O heg.tar.gz https://newsroom.gsfc.nasa.gov/sdptoolkit/HEG/HEG215/hegLNX64v2.15.Build9.8.tar.gz && \
    tar -xf heg.tar.gz && \
    printf 'y\n/opt/heg\ny\n/usr/bin\nheguser\n' | ./install && \
    rm -rf /opt/heg-install

ENV PATH /opt/heg/bin:$PATH
ENV JAVA_HOME /usr/lib/jvm/java-1.8.0-amazon-corretto
ENV MRTDATADIR /opt/heg/data
ENV PGSHOME /opt/heg/TOOLKIT_MTD
ENV HEGUSER heguser

CMD [ "bash", "-c", "tail -f /dev/null" ]

# on the host do:
# xhost +local:all