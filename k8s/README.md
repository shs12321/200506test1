```
# 이미지 실행
[root@node1 ~]# kubectl run nu --image=nginx_ubuntu --port=80
kubectl run --generator=deployment/apps.v1 is DEPRECATED and will be removed in a future version. Use kubectl run --generator=run-pod/v1 or kubectl create instead.
deployment.apps/nu created

#20개 pod 적용 실행
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

#오토스케일링을 위한 replicaset 확인
[root@node1 ~]# kubectl get rs
NAME               DESIRED   CURRENT   READY   AGE
nginx-7c45b84548   4         4         4       7h35m
nu-7bb4dc844b      20        20        0       5m40s

# 오토스케일링 적용
[root@node1 ~] kubectl autoscale rs nginx-7c45b84548 --max=10
horizontalpodautoscaler.autoscaling/nginx-7c45b84548 autoscaled

# 결과 확인
[root@node1 ~] kubectl get hpa #horizontal pod autoscalers
NAME               REFERENCE                     TARGETS         MINPODS   MAXPODS   REPLICAS   AGE
nginx-7c45b84548   ReplicaSet/nginx-7c45b84548   <unknown>/80%   1         10        4          37s

#결과 확인
[root@node1 ~] kubectl describe hpa/nginx-7c45b84548  
Name:                                                  nginx-7c45b84548
Namespace:                                             default
Labels:                                                <none>
Annotations:                                           <none>
CreationTimestamp:                                     Wed, 06 May 2020 17:39:00 +0800
Reference:                                             ReplicaSet/nginx-7c45b84548
Metrics:                                               ( current / target )
  resource cpu on pods  (as a percentage of request):  <unknown> / 80%
Min replicas:                                          1
Max replicas:                                          10
ReplicaSet pods:                                       4 current / 0 desired
Conditions:
  Type           Status  Reason                   Message
  ----           ------  ------                   -------
  AbleToScale    True    SucceededGetScale        the HPA controller was able to get the target's current scale
  ScalingActive  False   FailedGetResourceMetric  the HPA was unable to compute the replica count: unable to get metrics for resource cpu: unable to fetch metrics from resource metrics API: the server could not find the requested resource (get pods.metrics.k8s.io)
Events:
  Type     Reason                        Age               From                       Message
  ----     ------                        ----              ----                       -------
  Warning  FailedGetResourceMetric       3s (x6 over 78s)  horizontal-pod-autoscaler  unable to get metrics for resource cpu: unable to fetch metrics from resource metrics API: the server could not find the requested resource (get pods.metrics.k8s.io)
  Warning  FailedComputeMetricsReplicas  3s (x6 over 78s)  horizontal-pod-autoscaler  Invalid metrics (1 invalid out of 1), last error was: failed to get cpu utilization: unable to get metrics for resource cpu: unable to fetch metrics from resource metrics API: the server could not find the requested resource (get pods.metrics.k8s.io)

```
