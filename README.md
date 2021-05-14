# mod_auth_openidc

Example implementation of mod_auth_openidc


# Prerequisites
docker and docker-compose installed locally

OIDC credentials can be obtained from IAM by submitting a [Shibboleth Configuration Request Form](https://its.umich.edu/accounts-access/shibboleth/configuration-request-form)

For this example, the Application/service URL is:
http://localhost:8080
and the redirect URL is:
http://localhost:8080/secure/oidc/callback/

More information can be found at:
https://documentation.its.umich.edu/node/767

Note: A single set of credentials could have multiple allowed redirect URLs, but it is recommended to use separate credentials for each server, such as dev, qa, and production.

# Setup
OIDC Credentials must be put in a `.env` file, with the format:   

```shell
OIDC_CLIENT_ID=<client_id>
OIDC_CLIENT_SECRET=<client_secret>
OIDC_PASSPHRASE=<passphrase>
OIDC_REDIRECT_URI=http://localhost:8080/secure/oidc/callback/
OIDC_PROVIDER_URL=https://shib-idp-staging.dsc.umich.edu/.well-known/openid-configuration
```
The passphrase can be anything, it is only used locally for session state encryption purposes.

A production site would use the provider URL:
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
