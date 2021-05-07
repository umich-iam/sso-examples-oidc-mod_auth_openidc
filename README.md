# mod_auth_openidc

Example implementation of mod_auth_openidc


# Setup
OIDC Credentials must be available in env    
In a file with the format:
OIDC_CLIENT_ID=    
OIDC_CLIENT_SECRET=    
OIDC_PASSPHRASE=

Set secure permissions on the file, and put in a sucure place, like ~/.ssh


# Build

```shell
docker build . -t my-apache2
```


# Run
```shell
docker run -it --env-file <my-env-file> -p 8080:80 my-apache2
```

In a browser, navigate to "http://localhost:8080"
