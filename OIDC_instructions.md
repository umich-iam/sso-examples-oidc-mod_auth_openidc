**OIDC_instructions.md**

Step by step instructions for setting up OIDC authentication on an Apache web server.

Obtain OIDC credentials from IAM by submitting a [Shibboleth Configuration Request Form](https://its.umich.edu/accounts-access/shibboleth/configuration-request-form)

Install the packages:
```
ca-certificates
libapache2-mod-auth-openidc
```


Create a link:
```
ln -s /usr/lib/apache2/modules/mod_auth_openidc.so /usr/local/apache2/modules/mod_auth_openidc.so
```

In the Apache configuration, add:
```
LoadModule auth_openidc_module modules/mod_auth_openidc.so
# For further documentation see https://github.com/zmartzone/mod_auth_openidc
OIDCProviderMetadataURL ${OIDC_PROVIDER_URL}
OIDCClientID ${OIDC_CLIENT_ID}
OIDCClientSecret ${OIDC_CLIENT_SECRET}
OIDCProviderTokenEndpointAuth client_secret_post
# OIDCRedirectURI is a vanity URL that must point to a path protected by this module but must NOT point to any content
OIDCRedirectURI ${OIDC_REDIRECT_URI}
OIDCCryptoPassphrase "${OIDC_PASSPHRASE}"
# Here we configure what part fo the directory tree requires OIDC authorization
<Location /secure>
   AuthType openid-connect
   Require valid-user
   LogLevel debug
</Location>
```



The passphrase is used for session state encryption purposes between your application and your user.  It is not used by the OIDC provider, so it is not on the credentials form.

Restart Apache and try it!
