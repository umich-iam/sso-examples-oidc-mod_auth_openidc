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

Set up environment variables (store them securely):
```
OIDC_CLIENT_ID=<client_id>
OIDC_CLIENT_SECRET=<client_secret>
OIDC_PASSPHRASE=<passphrase>
OIDC_REDIRECT_URI=http://localhost:8080/secure/oidc/callback/
OIDC_PROVIDER_URL=https://shib-idp-staging.dsc.umich.edu/.well-known/openid-configuration
```

The passphrase is used for session state encryption purposes between your application and your user.  It is not used by the OIDC provider, so it is not on the credentials form.

A production site would use the provider URL:
OIDC_PROVIDER_URL=https://shibboleth.umich.edu/.well-known/openid-configuration

OIDC_REDIRECT_URI must point to a path protected by this module but must NOT point to any actual content

In the Apache configuration, add:
```
# load the OIDC module
LoadModule auth_openidc_module modules/mod_auth_openidc.so

# set OIDC parameters
OIDCProviderMetadataURL ${OIDC_PROVIDER_URL}
OIDCClientID ${OIDC_CLIENT_ID}
OIDCClientSecret ${OIDC_CLIENT_SECRET}
OIDCRedirectURI ${OIDC_REDIRECT_URI}
OIDCCryptoPassphrase "${OIDC_PASSPHRASE}"
OIDCProviderTokenEndpointAuth client_secret_post

# Configure which part fo the directory tree requires OIDC authorization
<Location /secure>
   AuthType openid-connect
   Require valid-user
   LogLevel debug
</Location>
```

Restart Apache and try it!
