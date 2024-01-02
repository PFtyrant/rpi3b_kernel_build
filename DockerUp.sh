#!/bin/bash


DockerImg=rpi3_builder
Tag="Buster"
echo "Build DockerImage: $DockerImg"

docker build -t="$DockerImg:$Tag" .

echo "Image Build Done"

docker run -it -v $PWD/linux:/root/test/linux --workdir /test $DockerImg /bin/bash

# echo "Run Docker with $DockerImg"
# docker-compose -f $DockerImg.yml up -d
