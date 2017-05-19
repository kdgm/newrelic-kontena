# Installing NewRelic nrsysmond on kontena nodes and master

This project contains a `kontena.yml` file for the `kdgm/newrelic-kontena` stack. This stack is used to run a single `nrsysmond` on each kontena node (`daemon` deployment strategy) to send metrics about the host system and running docker containers to NewRelic.

A script is provided also to deploy `nrsysmond` on the kontena master node.

## Nodes

Check you are on the desired grid (e.g. staging or production)

### Initial deploy of newrelic-kontena stack (nrsysmond)

    $ kontena stack install

### Deploying after changing `kontena.yml`

    $ kontena stack upgrade newrelic

### Deploying after changing `Dockerfile` or `docker-entrypoint.sh`

This builds `kdgm/newrelic-kontena` image and pushes the image to Docker Hub.

    $ kontena stack build
    $ kontena stack upgrade newrelic

## Master

The kontena master requires a different approach. Here we run the `christianbladescb/newrelic-coreos` image directly via `kontena master ssh` with the appropriate parameters.

Set the following env variables before running this script:

    $KONTENA_SSH_KEY: points to the ssh key file to login to kontena master

    $NEWRELIC_LICENSE: contains the NewRelic license key for your project/organization

### Deploying nrsysmond

The `kontena-master-nrsysmond-deploy.sh` script will deploy `nrsysmond` to the kontena master node.

    $ ./kontena-master-nrsysmond-deploy.sh
