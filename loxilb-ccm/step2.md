Make Pod First to use LoadBalancer service :

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
kubectl create -f loxi-nginx.yaml
```