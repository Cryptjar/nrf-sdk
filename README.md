nRF52 SDK
=========

This repository contains the Docker file for a development environment with the
Nordic SDK for nRF52 devices. It is intended to be used in CI setups for
building the nRF52 based projects.

This Docker image is based on Ubuntu 18.04 and contains the ARM GCC compiler
as well as the Nordic nRF52 SDK 15.3.0. It has an environment variable
`NRF52_SDK_15_3_0_HOME` which point to the root of the nRF52 SDK folder.


Building this image
-------------------

In order to create the docker image execute:

```sh
docker build .
```

To test it and execute (`<IMAGE>` refers to the hash returned by `docker build`):

```sh
docker container run -it --rm -v $(pwd):/code -w /code <IMAGE> make
```



