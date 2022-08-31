

Make pod for http service. We will use nginx application.

Write Pod yaml file

```
cat > loxi-nginx.yaml <<EOF
apiVersion: v1
kind: Pod
metadata:
  name: nginx
  labels:
    app.kubernetes.io/name: proxy
spec:
  containers:
  - name: nginx
    image: nginx:latest
    ports:
      - containerPort: 80
        name: http-web-svc
EOF
```

Deploy pod with following command:
```
kubectl create -f loxi-nginx.yaml
```

Check pod status with following command:
```
kubectl get pods | grep nginx
nginx   1/1     Running   0          15m
```

Write Service yaml file

```
cat > loxi-service.yaml <<EOF
---
apiVersion: v1
kind: Service
metadata:
  name: nginx-service
spec:
  type: LoadBalancer
  selector:
    app.kubernetes.io/name: proxy
  ports:
  - name: name-of-service-port
    protocol: TCP
    port: 8888
    targetPort: http-web-svc
EOF
```

Deploy pod with following command:

```
kubectl apply -f loxi-service.yaml
```

check service status with following command:
```
kubectl get svc | grep nginx
nginx-service   LoadBalancer   10.96.229.183   123.123.123.1   8888:30846/TCP   15m
```

If you reach this stage, you completed whole configuration successfully. Congratulation !
