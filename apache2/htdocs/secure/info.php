<html>
  <body>
    <center>
      <h1>Hello <?php echo(getenv('OIDC_CLAIM_sub')) ?></h1>
      <br>See OIDC_* in "Apache Environment" for OIDC variables passed by mod_auth_openidc<br>
      <br><a href="/secure/" style="text-decoration:underline">Or click here to go back to the private home page</a><br>
    </center>
  </body>
</html>

<?php

phpinfo();

getenv('OIDC_CLAIM_sub');
