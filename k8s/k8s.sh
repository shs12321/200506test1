kubectl run nu --image=nginx_ubuntu:v1 --port=80
kubectl scale deploy nu --replicas=20
