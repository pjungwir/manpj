kubectl --context=staging get nodes

kubectl --context=staging get pods

# Show secrets:
kubectl get secrets --all-namespaces
kubectl get secret the-secret-name -o jsonpath='{.data}' | jq
kubectl get secret the-secret-name -o jsonpath='{.data.foo}' | base64 --decode

# Get pods matching a label:
kubectl get pods -l app=foo
