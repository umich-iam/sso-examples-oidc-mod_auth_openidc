# mod_auth_openidc

Example implementation of mod_auth_openidc


# Requirements
docker and docker-compose installed locally


# Setup
OIDC Credentials must be available in a `.env` file, with the format:   

```shell
OIDC_CLIENT_ID=<client_id>
OIDC_CLIENT_SECRET=<client_secret>
OIDC_PASSPHRASE=<passphrase>
OIDC_REDIRECT_URI=http://localhost:8080/secure/oidc/callback/
OIDC_PROVIDER_URL=https://shib-idp-staging.dsc.umich.edu/.well-known/openid-configuration
```

A production site would use:
OIDC_PROVIDER_URL=https://shibboleth.umich.edu/.well-known/openid-configuration

Set secure permissions on the file (could put in a secure place, like ~/.ssh)


# Build

```shell
docker-compose build
```


# Run
```shell
docker-compose up
```

In a browser, navigate to "http://localhost:8080"


# Stop
```shell
docker-compose down
```
