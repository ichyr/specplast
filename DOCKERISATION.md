# Steps

1. Created good Dockerfile

2. Build image with tag name

   docker build -t specplast01 .

# Troubleshooting:

1. to run image do

   docker run -i -t specplast01 /bin/bash

2. bundle is not found error:

   https://github.com/docker-library/ruby/issues/24

3. Rmagic can't be installed

   Use imagemagic of same version (6.7.7-10) as on prod.
