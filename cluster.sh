[ $(uname -m) = x86_64 ] && curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.26.0/kind-linux-amd64


chmod +x ./kind


sudo mv ./kind /usr/local/bin/kind


cat > kind.yml <<EOF
# three node (two workers) cluster config
kind: Cluster
apiVersion: kind.x-k8s.io/v1alpha4
nodes:
  - role: control-plane  # This node will act as the control plane (master) node
  - role: worker         # This node will be a worker node
  - role: worker         # This node will also be a worker node
EOF



kind create cluster --config /root/kind.yml

