## Buildfile for the Zookeeper server.
## Email: petrousov@gmail.com
## Date: 22/01/2016

## 1) docker build -t centos-zookeeper .
## 2) docker run -d -P host_port:guest_port centos-zookeeper

FROM centos

MAINTAINER Ioannis Petrousov

RUN yum -y install git screen wget passwd python
RUN yum -y install java

#fix with your time
RUN ln -f -s /usr/share/zoneinfo/EET /etc/localtime

#get zookeeper
RUN cd /opt ; wget http://apache.otenet.gr/dist/zookeeper/zookeeper-3.4.6/zookeeper-3.4.6.tar.gz
RUN cd /opt ; tar -zxvf zookeeper-3.4.6.tar.gz
RUN mv /opt/zookeeper-3.4.6  /opt/zookeeper

#lets add bootsrap script
ADD files/bootstrap.sh /opt/
RUN chmod +x /opt/bootstrap.sh

#enable ssh
RUN yum -y install openssh-server.x86_64
RUN /usr/bin/ssh-keygen -A
RUN useradd -G root,wheel admin
RUN echo "admin:admin" | chpasswd
RUN echo "root:admin" | chpasswd
RUN /usr/sbin/sshd
