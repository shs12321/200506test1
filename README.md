# 200506test1#

# dockerfiles-ubuntu-user-adderable
Nginx install
curl install
docker.io install
tree install

# cloning
git clone https://github.com/shs12321/200506msaTest.git
cd 200506msaTest
cd ubuntu

# Building & Running

Copy the sources to your docker host and build the container, and to run.
```
	docker build --rm -t shs12321/nginx_ubuntu .
	docker run -it --name nu -p 8888:80 shs12321/nginx_ubuntu
```
Get the port that the container is listening on:

```
# docker ps
CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS               NAMES
ad2ad96e4b2f        nowage/nginx      "/bin/bash"         7 seconds ago       Up 6 seconds                            n1
```

To test, ("nowage" is username. )
```
	open 127.0.0.1:8888
```
To Rollback
```
    docker rm nu -f
    docker rmi shs12321/nginx_ubuntu
```
