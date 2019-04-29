# Example ASP.NET Core running on Balena

## Overview:

We have a simple multi-stage build `Dockerfile` which is in the balena-template format. This is to allow our cloud builders to do variable substitution on things like `%%BALENA_ARCH%%` which make the image suitable for `amd64` and `armv7hf` targets.

## To deploy this project:

+ Create a balena application using the cloud dashboard, e.g. `myAspNetCoreApp`
  + You can target any device type which is compatible with the following architectures:
    + `armv7hf`
    + `amd64`
+ Clone this repo to your machine:
  + `git clone https://github.com/balena-io-playground/balena-aspnet-core.git`
+ In the repo directory, use the `balena-cli` application to push it to your application:
  + `balena push myAspNetCoreApp`


This application will host a simple site on port `80` which you should be able to view once it is deployed.