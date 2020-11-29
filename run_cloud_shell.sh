export my_zone=us-central1-a
export my_cluster=standard-cluster-1
#To create a kubeconfig file with the credentials of the current user (to allow authentication) and provide the endpoint details for a specific cluster (to allow communicating with that cluster through the kubectl command-line tool)
gcloud container clusters get-credentials $my_cluster --zone $my_zone
kubectl apply -f ./nginx-deployment.yaml
kubectl get deployments
kubectl apply -f ./service-nginx.yaml
kubectl apply -f nginx-canary.yaml
#When the deployment is complete, verify that both the nginx and the nginx-canary deployments are present.
kubectl get deployments
#scale down the primary deployment to 0 replicas
kubectl scale --replicas=0 deployment nginx-deployment
kubectl get deployments
