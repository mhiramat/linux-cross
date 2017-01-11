# linux-cross

Linux cross-build environment by docker.

This dockerfile setups a sandbox for cross building environment based on lkp-test's [make.cross script](https://git.kernel.org/cgit/linux/kernel/git/wfg/lkp-tests.git/plain/sbin/make.cross).

To build the docker image, please run below command.
```:bash
sudo docker build -t linux-cross-build linux-cross-build/
```

And run the built image with your kernel tree as below

```:bash
sudo docker run -ti -v /path/to/your/kernel:/opt/linux linux-cross-build
```

## Tips

To speed up the build time, you can mount your tmpfs or localfs to
the container for build as below

```:bash
sudo docker run -ti -v /path/to/your/kernel:/opt/linux -v /path/to/tmpdir:/tmp  linux-cross-build
```

Note that on Fedora or other distros which enables SELinux on docker,
you have to set SELinux attribute on the directories exposed to the container.

```:bash
chcon -Rt svirt_sandbox_file_t /path/to/your/kernel
```
