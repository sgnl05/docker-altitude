# docker-altitude

A nice and easy way to get an Altitude server up and running using Docker. For
help on getting started with Docker see the [official getting started guide][0].
For more information on Altitude and check out it's [website][1].


## Building docker-altitude

Running this will build you a docker image with the latest version of docker-altitude..

    git clone https://github.com/sgnl05/docker-altitude
    cd docker-altitude
    sudo docker build -t sgnl05/altitude .


## Running docker-altitude

Running the first time will set your ports to static ports of your choice so
that you can easily map a proxy to them. If this is the only thing running on your
system you can map the udp ports to 27275 27276 and no proxy is needed. i.e.
`-p=27275:27275/udp -p=27276:27276/udp` .
Also be sure your mounted directory on your host machine is
already created before running `mkdir -p /mnt/altitude`.

    sudo docker run -d=true -p=25565:25565 -v=/mnt/altitude:/data sgnl05/altitude

From now on when you start/stop docker-altitude you should use the container id
with the following commands. To get your container id, after you initial run
type `sudo docker ps` and it will show up on the left side followed by the
image name which is `sgnl05/altitude:latest`.

    sudo docker start <container_id>
    sudo docker stop <container_id>


### Notes on the run command

 + `-v` is the volume you are mounting `-v=host_dir:docker_dir`
 + `sgnl05/altitude` is simply what I called my docker build of this image
 + `-d=true` allows this to run cleanly as a daemon, remove for debugging
 + `-p` is the port it connects to, `-p=host_port:docker_port`


[0]: http://www.docker.io/gettingstarted/
[1]: http://altitudegame.com/
