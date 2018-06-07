# linux-cross

Linux cross-build environment by docker.

This dockerfile setups a sandbox for cross building environment based on lkp-test's [make.cross script](https://git.kernel.org/cgit/linux/kernel/git/wfg/lkp-tests.git/plain/sbin/make.cross).

To build the docker image, please run below command.
```:bash
sudo docker build -t linux-cross-build linux-cross-build/
```

Note that this image will consumes more than 3GB, so huge. You should check your disk has enough space.


And run the built image with your kernel tree as below

```:bash
sudo docker run -ti -v /path/to/your/kernel:/opt/linux linux-cross-build
```

This builds the kernel for "i386 x86\_64 arm arm64 ia64 mips powerpc s390 sparc64 sh openrisc".

To build some specific archs in above arch, you can pass it as a parameter like below.


```:bash
sudo docker run -ti -v /path/to/your/kernel:/opt/linux linux-cross-build arm
```


## Tips

To speed up the build time, you can mount your tmpfs or localfs to the container for build as below (you should use --rm option so that the container is removed automatically after use, since this container is just for build environment.)

```:bash
sudo docker run -ti --rm -v /path/to/your/kernel:/opt/linux -v /path/to/tmpdir:/tmp  linux-cross-build
```

Note that on Fedora or other distros which enables SELinux on docker,
you have to set SELinux attribute on the directories exposed to the container.

```:bash
chcon -Rt svirt_sandbox_file_t /path/to/your/kernel
```
