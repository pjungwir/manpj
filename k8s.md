kubectl --context=staging get nodes

kubectl --context=staging get pods

# Show secrets:

kubectl get secrets --all-namespaces
kubectl get secret the-secret-name -o jsonpath='{.data}' | jq
kubectl get secret the-secret-name -o jsonpath='{.data.foo}' | base64 --decode

# Get pods matching a label:

kubectl get pods -l app=foo

# Useful image for debugging problems:

k debug mypod -it --image=nicolaka/netshoot

# For k3s

Lots of details:

```
sudo k3s check-config
```


To stop all the containers (since `sudo systemctl stop k3s` doesn't do it, per https://github.com/k3s-io/k3s/issues/2583):

```
sudo /usr/local/bin/k3s-killall.sh
```

This is good if you're trying to give the ports back to an nginx running on the host.
