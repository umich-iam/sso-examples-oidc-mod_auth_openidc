# mod_auth_openidc

Example implementation of [mod_auth_openidc](https://github.com/zmartzone/mod_auth_openidc). This repo demonstrates installing and configuring mod_auth_openidc in a `httpd:2.4` container. For RHEL, see the `rhel` branch.

# Prerequisites
docker and docker-compose installed locally
- https://docs.docker.com/get-docker/
- https://docs.docker.com/compose/install/

OIDC credentials can be obtained from IAM by submitting a [Shibboleth Configuration Request Form](https://its.umich.edu/accounts-access/shibboleth/configuration-request-form)

For this example, the Application/service URL is:
http://localhost:8080
and the redirect URL is:
http://localhost:8080/secure/oidc/callback/

More information can be found at:
https://documentation.its.umich.edu/node/767

Note: A single set of credentials could have multiple allowed redirect URLs, but it is recommended to use separate credentials for each server, such as dev, qa, and production.

# Setup
git clone this repository and change to the directory

Put your OIDC Credentials in a file called `.env`, with the format:   

```shell
OIDC_CLIENT_ID=<client_id>
OIDC_CLIENT_SECRET=<client_secret>
OIDC_PASSPHRASE=<passphrase>
OIDC_REDIRECT_URI=http://localhost:8080/secure/oidc/callback/
OIDC_PROVIDER_URL=https://shib-idp-staging.dsc.umich.edu/.well-known/openid-configuration
```
The passphrase is used for session state encryption purposes between your application and your user.

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
