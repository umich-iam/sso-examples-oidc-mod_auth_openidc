# mod_auth_openidc

Example implementation of mod_auth_openidc


# Setup
OIDC Credentials must be available in ./env

.env:
```shell
OIDC_CLIENT_ID=<client_id>
OIDC_CLIENT_SECRET=<client_secret>
OIDC_PASSPHRASE=<passphrase>
OIDC_REDIRECT_URI=http://localhost:8080/secure/oidc/callback/
```


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
