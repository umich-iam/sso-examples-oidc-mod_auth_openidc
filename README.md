# mod_auth_openidc

Example implementation of mod_auth_openidc


# Setup
OIDC Credentials must be available in env

# Build

```shell
docker build . -t my-apache2
```


# Run
```shell
docker run -it --env-file <my-env-file> -p 8080:80 my-apache2
```
