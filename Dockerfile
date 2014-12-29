FROM phusion/baseimage:0.9.15

ENV HOME /root

CMD ["/sbin/my_init"]

RUN rm -rf /etc/service/sshd /etc/my_init.d/00_regen_ssh_host_keys.sh

RUN apt-get update
RUN apt-get install -y gcc-multilib

RUN curl -s "https://dl.dropboxusercontent.com/u/3289117/ventrilo_srv-3.0.3-Linux-i386.tar.gz" -o /tmp/ventrilo.tgz
RUN tar -zxf /tmp/ventrilo.tgz -C /opt
RUN rm -f /tmp/ventrilo.tgz

ADD ventrilo_srv.ini /opt/ventsrv/ventrilo_srv.ini

RUN mkdir /etc/service/ventrilo
ADD ventrilo.sh /etc/service/ventrilo/run

EXPOSE 3784/tcp 3784/udp

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
