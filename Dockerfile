FROM httpd:2.4

RUN apt-get update \
  && apt-get install ca-certificates
  && apt-get install -y libapache2-mod-auth-openidc \
  && ln -s /usr/lib/apache2/modules/mod_auth_openidc.so /usr/local/apache2/modules/mod_auth_openidc.so

COPY ./htdocs/ /usr/local/apache2/htdocs/
COPY ./my-httpd.conf /usr/local/apache2/conf/httpd.conf
