# ucs-kvm-console-docker

## How to use

#### 1. Download viewer.jnlp from UCS

#### 2. Create an ssh tunnel on the host

```
host# ssh -f -N -L 10443:192.168.0.1:443 -L 2068:192.168.0.1:2068 user@192.168.0.254
```

#### 3. Run Docker

* Run from the Docker container
```
host$ xhost local:

host$ docker run -i -t --rm --network host \
    -e DISPLAY=$DISPLAY \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -v $(pwd)/viewer.jnlp:/viewer.jnlp:ro \
    ucs-kvm-console

container$ /run.sh
```

* Or execute via ssh
```
host$ docker run -i -t --rm --network host \
    -e SSH_PORT=10022 \
    -v $(pwd)/viewer.jnlp:/viewer.jnlp:ro \
    -v ${HOME}/.ssh/id_rsa.pub:/home/ucs/.ssh/authorized_keys \
    ucs-kvm-console
    
container$ /ssh.sh

host$ ssh ucs@localhost -p 10022 -X -i ~/.ssh/id_rsa

container[ssh]$ /run.sh
```

## Environment variables

#### SSH_PORT

Default: 22
