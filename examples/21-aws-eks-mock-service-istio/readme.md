# INSTALLATION ISTIO Linux or macOS

Download ISTIO V 1.11.2 for kubernetes 1.21

curl -L https://istio.io/downloadIstio | ISTIO_VERSION=1.11.2  sh -

cd istio-1.11.2/


export PATH=$PWD/bin:$PATH


istioctl install

# Verify 

kubectl -n istio-system get deploy
