

oc create clusterrole kubeinvaders-role --verb=watch,get,delete,list --resource=pods

oc get namespaces
## You can define multiple namespaces ex: TARGET_NAMESPACE=foobar,foobar2
read -p 'Enter target namespaces from above ex: foobar,foobar2 : ' TARGET_NAMESPACE

oc get routes
# Choose route host for your kubeinvaders instance.
read -p 'Enter route host from above: ' ROUTE_HOST

# TARGET_NAMESPACE=foobar,awesome-namespace
# ROUTE_HOST=<PUT ROUTE HOST HERE>

# # Please add your source ip IP_WHITELIST. This will add haproxy.router.openshift.io/ip_whitelist in KubeInvaders route
# # https://docs.openshift.com/container-platform/3.9/architecture/networking/routes.html#whitelist
# IP_WHITELIST="93.44.96.4"

echo 'Creating KubeInvaders project'
oc new-project kubeinvaders --display-name='KubeInvaders'

echo 'Creating service account kubeinvaders'
oc create sa kubeinvaders -n kubeinvaders

echo 'Adding cluster role to user kubeinvaders'
oc adm policy add-cluster-role-to-user kubeinvaders-role -z kubeinvaders -n kubeinvaders

echo 'Generating KUBEINVADERS_SECRET'
KUBEINVADERS_SECRET=$(oc get secret -n kubeinvaders --field-selector=type==kubernetes.io/service-account-token | grep 'kubeinvaders-token' | awk '{ print $1}' | head -n 1)

echo ''
oc process -f openshift/KubeInvaders.yaml -p ROUTE_HOST=$ROUTE_HOST -p TARGET_NAMESPACE=$TARGET_NAMESPACE -p KUBEINVADERS_SECRET=$KUBEINVADERS_SECRET | oc create -f -