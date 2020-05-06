# 200506test1#

# dockerfiles-ubuntu-user-adderable
Nginx install
curl install
docker.io install
tree install

# cloning
git clone https://github.com/shs12321/200506test1.git


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

#도커 빌드
docker build --rm -t shs12321/nginx_ubuntu .
Sending build context to Docker daemon  3.072kB
Step 1/6 : FROM ubuntu
 ---> 1d622ef86b13
Step 2/6 : COPY ./install.sh /
 ---> Using cache
 ---> d66956c17429
Step 3/6 : RUN chmod 755 /install.sh
 ---> Using cache
 ---> 82f2115f1259
Step 4/6 : RUN /install.sh
 ---> Using cache
 ---> fe5f623f2b84
Step 5/6 : CMD [ "nginx", "-g", "daemon off;"]
 ---> Using cache
 ---> d881f91fddbd
Step 6/6 : expose 80
 ---> Using cache
 ---> dc1abe728e9a
Successfully built dc1abe728e9a
Successfully tagged shs12321/nginx_ubuntu:latest
root@u1:~/200506test1/ubuntu# docker run -d --name nu -p 8888:80 shs12321/nginx_ubuntu
25410477f2b50ec645180c9eab7a92dd55777b7f836c4ce68ce264d0951144ca
docker: Error response from daemon: driver failed programming external connectivity on endpoint nu (a0b2878f7141decdb094516be79fe589cba9363767a60daff810b1d015f10c3b): Bind for 0.0.0.0:8888 failed: port is already allocated.


docker ps
CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS              PORTS                  NAMES
42d8bb80aee5        nowage/nginx        "nginx -g 'daemon of…"   12 minutes ago      Up 12 minutes       0.0.0.0:8888->80/tcp   n1
36c86923abf2        167b2d508ee0        "/bin/sh -c /install…"   37 minutes ago      Up 37 minutes        
