# Upgrading Major Releases

## 1.x -> 2.x

The docker-compose version has been updated from 1.x to 2.x which means the command to use is now `docker compose` instead of `docker-compose`.

The actual usage is the same as v1 (at least that is what the docker documentation says).

In order to get rid of the v1 version either manually delete the `/user/local/bin/docker-compose` and `/etc/bash_completion.d/docker-compose` files
or use the `:uninstall` action in the `codenamephp_docker_compose` resource. The resource will only be available in the v3 major release of the `codenamephp_docker`
cookbook.
