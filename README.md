# How to install and use docker

I will install it on my wsl with ubuntu 

```
sudo apt-get install docker.io
```

### Oracle linux 

```
dnf config-manager --add-repo=https://download.docker.com/linux/centos/docker-ce.repo \
&& dnf install docker-ce -y \
&& systemctl enable --now docker \
&& docker ps

```
