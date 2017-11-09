# Installing NewRelic newrelic-infra on kontena nodes and master

This project contains a `kontena.yml` file for the `kdgm/newrelic-kontena` stack. This stack is used to run a single `newrelic-infra` agent on each kontena node (`daemon` deployment strategy) to send metrics about the host system and running docker containers to NewRelic.

A script (`master-deploy.sh`) is also provided to deploy `newrelic-infra` on the kontena master node.

## Nodes

Check you are on the desired grid (e.g. staging or production)

### Initial deploy of newrelic-kontena stack (newrelic-infra)

    $ kontena stack install

### Deploying after changing `kontena.yml`

    $ kontena stack upgrade newrelic

### Deploying after changing `Dockerfile` or `docker-entrypoint.sh`

This builds `kdgm/newrelic-kontena` image and pushes the image to Docker Hub.

    $ kontena stack build
    $ kontena stack upgrade newrelic

## Master

The kontena master requires a different approach. Here we run the `newrelic/infrastructure:latest` image directly via `kontena master ssh` with the appropriate parameters.

Set the following env variables before running this script:

    $KONTENA_SSH_KEY: points to the ssh key file to login to kontena master

    $NEWRELIC_LICENSE: contains the NewRelic license key for your project/organization

### Deploying newrelic-infra

The `master-deploy.sh` script will deploy `newrelic-infra` to the kontena master node.

    $ ./master-deploy.sh
