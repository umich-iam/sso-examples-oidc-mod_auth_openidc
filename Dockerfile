FROM httpd:2.4


# Install dependencies
RUN apt-get update \
  && apt-get install -y ca-certificates \
  && apt-get install -y libapache2-mod-auth-openidc \
  && ln -s /usr/lib/apache2/modules/mod_auth_openidc.so /usr/local/apache2/modules/mod_auth_openidc.so
