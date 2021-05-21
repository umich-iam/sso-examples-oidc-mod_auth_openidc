FROM registry.aws.web.umich.edu/openshift/httpd:2.4-rhel
USER root
WORKDIR /opt/app-root/src



# Install dependencies
# No subscription-manager for this test image
RUN yum update && yum install -y \
  jansson \
  wget \
  && wget \
  http://mirror.centos.org/centos/7/os/x86_64/Packages/jansson-devel-2.10-1.el7.x86_64.rpm \
  http://mirror.centos.org/centos/7/os/x86_64/Packages/pcre2-10.23-2.el7.x86_64.rpm \
  https://github.com/zmartzone/mod_auth_openidc/releases/download/v2.4.0/cjose-0.6.1.5-1.el7.x86_64.rpm \
  https://download-ib01.fedoraproject.org/pub/epel/7/x86_64/Packages/h/hiredis-0.12.1-2.el7.x86_64.rpm \
  https://github.com/zmartzone/mod_auth_openidc/releases/download/v2.4.8.2/mod_auth_openidc-2.4.8.2-1.el7.x86_64.rpm \
  && yum localinstall -y \
  jansson-devel-2.10-1.el7.x86_64.rpm \
  pcre2-10.23-2.el7.x86_64.rpm \
  cjose-0.6.1.5-1.el7.x86_64.rpm \
  hiredis-0.12.1-2.el7.x86_64.rpm \
  && rpm -i --nodeps mod_auth_openidc-2.4.8.2-1.el7.x86_64.rpm \
  && ln -s /usr/lib64/httpd/modules/mod_auth_openidc.so /etc/httpd/modules/mod_auth_openidc.so \
  && yum install -y httpd24-mod_php
