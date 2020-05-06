docker pull shs12321/nginx_ubuntu
kubectl run nu --image=nginx_ubuntu:v1 --port=80
kubectl scale deploy nu --replicas=20
