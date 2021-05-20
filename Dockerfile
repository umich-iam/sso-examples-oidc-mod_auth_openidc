FROM httpd:2.4


# Install dependencies
RUN apt-get update && apt-get install -y \
  ca-certificates \
  libapache2-mod-auth-openidc \
  libapache2-mod-php \
  && ln -s /usr/lib/apache2/modules/mod_auth_openidc.so /usr/local/apache2/modules/mod_auth_openidc.so \
  && ln -s /usr/lib/apache2/modules/libphp7.3.so /usr/local/apache2/modules/libphp7.3.so
