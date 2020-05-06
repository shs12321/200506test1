```
# 이미지 실행
[root@node1 ~]# kubectl run nu --image=nginx_ubuntu --port=80
kubectl run --generator=deployment/apps.v1 is DEPRECATED and will be removed in a future version. Use kubectl run --generator=run-pod/v1 or kubectl create instead.
deployment.apps/nu created

#오토스케일 20개 pod 적용 실행
[root@node1 ~]# kubectl scale deploy nu --replicas=20
deployment.extensions/nu scaled


[root@node1 ~]# kubectl get svc
NAME         TYPE        CLUSTER-IP      EXTERNAL-IP   PORT(S)        AGE
kubernetes   ClusterIP   10.254.0.1      <none>        443/TCP        14d
nginx        NodePort    10.254.121.91   <none>        80:32339/TCP   7h8m


[root@node1 ~]# ^C
[root@node1 ~]# kubectl get po
NAME                     READY   STATUS             RESTARTS   AGE
nginx-7c45b84548-9xbcp   1/1     Running            0          7h32m
nginx-7c45b84548-cdfkq   1/1     Running            0          6h57m
nginx-7c45b84548-smljb   1/1     Running            0          5h1m
nginx-7c45b84548-vzqm9   1/1     Running            0          5h1m
nu-7bb4dc844b-2xff8      0/1     ImagePullBackOff   0          2m58s
nu-7bb4dc844b-9sr6h      0/1     ImagePullBackOff   0          2m58s
nu-7bb4dc844b-cj8s7      0/1     ImagePullBackOff   0          2m58s
nu-7bb4dc844b-d2nmb      0/1     ImagePullBackOff   0          2m58s
nu-7bb4dc844b-d96hg      0/1     ImagePullBackOff   0          2m58s
nu-7bb4dc844b-fdh8z      0/1     ImagePullBackOff   0          2m58s
nu-7bb4dc844b-fdpl9      0/1     ImagePullBackOff   0          2m58s
nu-7bb4dc844b-hkw44      0/1     ImagePullBackOff   0          2m58s
nu-7bb4dc844b-jqp25      0/1     ImagePullBackOff   0          2m58s
nu-7bb4dc844b-krwnb      0/1     ImagePullBackOff   0          2m58s
nu-7bb4dc844b-l22kc      0/1     ImagePullBackOff   0          3m12s
nu-7bb4dc844b-llx4r      0/1     ImagePullBackOff   0          2m58s
nu-7bb4dc844b-n5t2c      0/1     ImagePullBackOff   0          2m58s
nu-7bb4dc844b-qgnz2      0/1     ImagePullBackOff   0          2m58s
nu-7bb4dc844b-qj6sw      0/1     ImagePullBackOff   0          2m58s
nu-7bb4dc844b-rw64z      0/1     ImagePullBackOff   0          2m58s
nu-7bb4dc844b-sjxhn      0/1     ImagePullBackOff   0          2m58s
nu-7bb4dc844b-sl74v      0/1     ImagePullBackOff   0          2m58s
nu-7bb4dc844b-tsd9j      0/1     ImagePullBackOff   0          2m58s
nu-7bb4dc844b-xwb2d      0/1     ImagePullBackOff   0          2m58s
[root@node1 ~]#

```
