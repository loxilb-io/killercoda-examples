

Make External Service as follows referencing [link](https://loxilb-io.github.io/loxilbdocs/ccm/) :

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
kubectl create -f loxi-service.yaml
```