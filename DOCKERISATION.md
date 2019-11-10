# How to use

1. build specplast comtainer
2. run `docker-compose up`
3. login to `web` container `docker-compose exec web bash` and run

   rake db:create
   rake db:migrate
   rake db:seed

4. Now you can see something at localhost:3000

# Steps

1. Created good Dockerfile

2. Build image with tag name

   docker build -t specplast01 .

3. Use postgres docker images env varialbes from https://hub.docker.com/_/postgres

# Troubleshooting:

1. to run image do

   docker run -i -t specplast01 /bin/bash

2. bundle is not found error:

   https://github.com/docker-library/ruby/issues/24

3. Rmagic can't be installed

   Use imagemagic of same version (6.7.7-10) as on prod.
