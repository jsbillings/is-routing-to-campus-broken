FROM centos:7
MAINTAINER jsbillin@umich.edu

# Install core dependencies
RUN yum -y update && yum -y install bind-utils bash

ADD dnstest.sh /test/

USER nobody
ENTRYPOINT ["/usr/bin/bash","/test/dnstest.sh"]
