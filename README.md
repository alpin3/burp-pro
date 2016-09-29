# alpin3/burp-pro

Portswigger Burp Pro on Alpine

Image is based on the [openjdk](https://hub.docker.com/_/openjdk/) base image

## Docker image size

[![Latest](https://badge.imagelayers.io/alpin3/burp-pro.svg)](https://imagelayers.io/?images=alpin3/burp-pro:latest 'latest')

## Docker image usage

```
docker run [docker-options] alpin3/burp-pro
```

## Examples

Typical usage:

X11 forwarding:
```
XSOCK=/tmp/.X11-unix
XAUTH=/tmp/.docker.xauth
xauth nlist :0 | sed -e 's/^..../ffff/' | xauth -f $XAUTH nmerge -
docker run -v $XSOCK:$XSOCK -v $XAUTH:$XAUTH -e XAUTHORITY=$XAUTH -e DISPLAY=$DISPLAY alpin3/burp-pro
```

Burp Collaborator server:
```
cp work/collaborator.config /tmp/collaborator.config
docker run -it -p 80:8080 -p 53:8053 -p 443:8443 -v /tmp/collaborator.config:/work/collaborator.config alpin3/burp-pro --collaborator-server
```

### Todo
- [ ] Provide more examples
