# KubeInvaders

*KubeInvaders is a gamified chaos engineering tool for Kubernetes. It is like Space Invaders but the aliens are PODs*

### Description

KubeInvaders has been developed using Defold (https://www.defold.com/).

Through KubeInvaders you can stress your Openshift cluster in a fun way and check how it is resilient.

```
# Please set target_namespace to set your target namespace!
helm install --set-string target_namespace="namespace1\,namespace2" --name kubeinvaders --namespace kubeinvaders ./helm-charts/kubeinvaders
```

### Special Input Keys

| Input           | Action                                                                                    |
|-----------------|-------------------------------------------------------------------------------------------|
|     n           | Change namespace (you should define namespaces list. Ex: TARGET_NAMESPACE=foo1,foo2,foo3).|
|     a           | Switch to automatic mode.                                                                 |
|     m           | Switch to manual mode.                                                                    |
|     h           | Show special keys.                                                                        |
|     q           | Hide help for special keys.                                                               |
|     i           | Show pod's name. Move the ship towards an alien.                                          |


### Environment Variables - Make the game more difficult to win!

Set the following variables in Kubernetes Deployment or Openshift DeploymentConfig

| ENV Var                     | Description                                                                   |
|-----------------------------|-------------------------------------------------------------------------------|
| ALIENPROXIMITY (default 15) | Reduce the value to increase distance between aliens                          |
| HITSLIMIT (default 0)       | Seconds of CPU time to wait before shooting                                   |
| UPDATETIME (default 1)      | Seconds to wait before update PODs status (you can set also 0.x Es: 0.5)      |


### Install with HELM!

```
# Please set target_namespace to set your target namespace!
helm install --set-string target_namespace="namespace1\,namespace2" --name kubeinvaders --namespace kubeinvaders ./helm-charts/kubeinvaders
```

### Install KubeInvaders on Openshift

To Install KubeInvaders on your Openshift Cluster clone this repo and launch the following commands and provide all :


```bash
chmod +x install.sh

./install.sh
```
You can change the namespace within the KubeInvaders pod enviroment variables on OpenShift once setup. e.g jmeter,KubeInvaders
