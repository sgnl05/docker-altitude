# docker-altitude

A nice and easy way to get an Altitude server up and running using Docker. For
help on getting started with Docker see the [official getting started guide][0].
For more information on Altitude and check out it's [website][1].


## Building docker-altitude

Running this will build you a docker image with the latest version of docker-altitude..

```bash
git clone https://github.com/sgnl05/docker-altitude
cd docker-altitude
docker build -t sgnl05/altitude .
```

## Running docker-altitude

Running the first time will set your ports to static ports of your choice so
that you can easily map a proxy to them. If this is the only thing running on your
system you can map the udp ports to 27275 27276 and no proxy is needed. i.e.
`-p=27275:27275/udp -p=27276:27276/udp` .
Also be sure your mounted directory on your host machine is
already created before running `mkdir -p /mnt/altitude`.

```bash
docker run --name=altitude -d=true -p=27275:27275/udp -p=27276:27276/udp -v=/mnt/altitude:/data sgnl05/altitude
```

From now on when you start/stop docker-altitude you should use the container name 
with the following commands. If you havent specified a name then Docker will generate one for you. To get your container name, after you initial run type `sudo docker ps` and it will show up on the right side side.

```bash
docker start <NAME>
docker stop <NAME>
```

### Notes on the run command

 + `--name` is the container name. Set this to whatever single word you want.
 + `-v` is the volume you are mounting `-v=host_dir:docker_dir`
 + `sgnl05/altitude` is simply what I called my docker build of this image
 + `-d=true` allows this to run cleanly as a daemon, remove for debugging
 + `-p` is the port it connects to, `-p=host_port:docker_port`

### Credits

Code is based on [docker-minecraft][2] by Isaac Bythewood.

[0]: http://www.docker.io/gettingstarted/
[1]: http://altitudegame.com/
[2]: https://github.com/overshard/docker-minecraft
