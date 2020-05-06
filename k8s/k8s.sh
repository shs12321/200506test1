docker pull shs12321/nginx_ubuntu
kubectl run nu --image=nginx_ubuntu:v1 --port=80
kubectl scale deploy nu --replicas=20
kubectl get po
kubectl get rs
kubectl autoscale rs nginx-7c45b84548 --max=10
kubectl get hpa
kubectl describe hpa/nginx-7c45b84548
