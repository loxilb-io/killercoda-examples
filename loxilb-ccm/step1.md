

we need to configure load-balancer CCM as follows referencing [link](https://loxilb-io.github.io/loxilbdocs/ccm/) :

```
echo '============= Deploy Loxi CCM ============'
cat > loxi-ccm.yaml <<EOF
---
apiVersion: v1
kind: ServiceAccount
metadata:
  name: loxi-cloud-controller-manager
  namespace: kube-system
---
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRoleBinding
metadata:
  name: system:cloud-controller-manager
roleRef:
  apiGroup: rbac.authorization.k8s.io
  kind: ClusterRole
  name: cluster-admin
subjects:
  - kind: ServiceAccount
    name: loxi-cloud-controller-manager
    namespace: kube-system
---
apiVersion: v1
kind: ConfigMap
metadata:
  name: loxilb-config
  namespace: kube-system
data:
  apiServerURL: "http://172.18.0.3:11111"
  externalIPcidr: 123.123.123.0/24
---
apiVersion: apps/v1
kind: DaemonSet
metadata:
  labels:
    k8s-app: loxi-cloud-controller-manager
  name: loxi-cloud-controller-manager
  namespace: kube-system
spec:
  selector:
    matchLabels:
      k8s-app: loxi-cloud-controller-manager
  template:
    metadata:
      labels:
        k8s-app: loxi-cloud-controller-manager
    spec:
      serviceAccountName: loxi-cloud-controller-manager
      containers:
        - name: loxi-cloud-controller-manager
          imagePullPolicy: Always
          image: loxilbio/loxi-ccm:beta
          command:
            - /bin/loxi-cloud-controller-manager
          args:
            - --v=1
            - --cloud-provider=netlox
            - --use-service-account-credentials
            - --leader-elect-resource-name=loxi-cloud-controller-manager
          env:
            - name: LOXILB_API_SERVER
              valueFrom:
                configMapKeyRef:
                  name: loxilb-config
                  key: apiServerURL
            - name: LOXILB_EXTERNAL_CIDR
              valueFrom:
                configMapKeyRef:
                  name: loxilb-config
                  key: externalIPcidr
      tolerations:
        - key: node.cloudprovider.kubernetes.io/uninitialized
          value: "true"
          effect: NoSchedule
        - key: node-role.kubernetes.io/control-plane
          effect: NoSchedule
      nodeSelector:
        node-role.kubernetes.io/control-plane: ""
EOF
kubectl create -f loxi-ccm.yaml