#FROM debian:8.7
FROM centos:7.3.1611
MAINTAINER "Mr. Purple" <patrick.logan@radiancetech.com>
LABEL version="0.0.1"
RUN mkdir /target
RUN mkdir /iozone
COPY iozone3_465.tar /iozone/
RUN tar -xf /iozone/iozone3_465.tar -C /iozone
WORKDIR /iozone/iozone3_465/src/current/
RUN chmod 777 makefile
RUN yum install -y make gcc
#RUN apt-get -y update
#RUN apt-get -y install build-essential
RUN make /iozone/iozone3_465/src/current/ linux-AMD64
#ENV PATH = "/iozone/iozone3_465/src/current/:$PATH"
RUN mkdir /output
RUN chmod +x iozone
RUN echo $PWD
#COPY docker-entrypoint.sh /iozone/iozone3_465/src/current
#RUN chmod +x docker-entrypoint.sh
RUN yum install -y git
RUN git clone https://github.com/tennixpl/ioz-json-export.git
# RUN yum install -y python36u

COPY ./docker-entrypoint.sh /
RUN ls
#RUN chmod +x /usr/local/bin/docker-entrypoint.sh
#RUN cat docker-entrypoint.sh
##RUN ls
ENTRYPOINT ["/docker-entrypoint.sh"]
#CMD ["./iozone","-a"," >", "/output/output.txt"]
#CMD ["./docker-entrypoint.sh"]
CMD []
