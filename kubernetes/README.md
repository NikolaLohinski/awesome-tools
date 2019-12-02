# Kubernetes

## Content
* [Telepresence](#telepresence)
* [Kubernetes context - `kubectx`](#kubernetes-context)
* [K9S](#k9s)
* [Kubernetes in Docker](#kubernetes-in-docker)

## Telepresence
### Installation
Just follow the script given on https://www.telepresence.io/reference/install
```
curl -s https://packagecloud.io/install/repositories/datawireio/telepresence/script.deb.sh | sudo bash sudo apt install --no-install-recommends telepresence
```

### Use to debug your local service

#### Cluster configuration
Telepresence is using the kubectl commands so you just have to connect to your cluster using the command line given in the google cloud platform console.
Since we enabled the k8s network policies, we need to deploy the telepresence node we will later connect to by applying the following file: telepresence.yaml
```
kubectl apply -f /tmp/telepresence.yaml
```

#### Execution
Then you just have to type Telepresence in your console: all the cluster IPs are proxyfied automatically.
```
telepresence --deployment telepresence --run-shell --also-proxy SOME.IP.TO.PROXYFY
```

#### Swap Deployment
The swap deployment is useful as it replace the current deployment by your local environment. So you are able to debug the code being edited in goland. In order to do the replacement, telepresence set the replicaset to 0 in your cluster.
The following command is used to replace the format-worker deployment:
```
telepresence --also-proxy 192.168.1.249 --also-proxy 192.168.1.250 --swap-deployment format-worker
```
In the case of an non-worker pod, you must add --expose 8080 to bind the port in the cluster

## Kubernetes context

Switch faster between clusters and namespaces in kubectl with [kubectx](https://kubectx.dev).

## K9S

[K9s](https://github.com/derailed/k9s) provides a curses based terminal UI to interact with your Kubernetes clusters. The aim of this project is to make it easier to navigate, observe and manage your applications in the wild. K9s continually watches Kubernetes for changes and offers subsequent commands to interact with observed Kubernetes resources.

## Kubernetes in Docker

[`kind`](https://github.com/kubernetes-sigs/kind) is a very useful tool for running local Kubernetes clusters using Docker container "nodes".