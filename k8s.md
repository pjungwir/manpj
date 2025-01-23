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

# To move pods from one node group to another:

The goal is to launch pods on the new nodes *before* killing the pods on the old nodes.

- Create the new node group. Wait until the nodes are ready.
- Taint the old nodes so no new pods will get scheduled there:

```
  k taint nodes ip-10-10-245-95.ec2.internal key1=value1:NoSchedule
```
- Scale the deployment to launch new pods, which should all get scheduled on the new nodes:

```
k scale deployment --replicas=2 -n foo bar
```

- Drain the old nodes:

```
k drain ip-10-10-245-95.ec2.internal --ignore-daemonsets --delete-emptydir-data
```

- Scale down:

```
k scale deployment --replicas=1 -n foo bar
```
