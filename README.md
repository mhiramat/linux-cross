# linux-cross

Linux cross-build environment by docker.

This dockerfile setups a sandbox for cross building environment.

To build the docker image, please run below command.
```:bash
sudo docker build -t linux-cross-build linux-cross-build/
```

And run the built image with your kernel tree as below

```:bash
sudo docker run -ti -v /path/to/your/kernel:/opt/linux linux-cross-build
```
