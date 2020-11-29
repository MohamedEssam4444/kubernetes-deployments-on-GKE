export my_zone=us-central1-a
export my_cluster=standard-cluster-1
#To create a kubeconfig file with the credentials of the current user (to allow authentication) and provide the endpoint details for a specific cluster (to allow communicating with that cluster through the kubectl command-line tool)
gcloud container clusters get-credentials $my_cluster --zone $my_zone
kubectl apply -f ./nginx-deployment.yaml
kubectl get deployments
kubectl apply -f ./service-nginx.yaml
#To update the version of nginx in the deployment, execute the following command
kubectl set image deployment.v1.apps/nginx-deployment nginx=nginx:1.9.1 --record#This updates the container image in your Deployment to nginx v1.9.1.
kubectl apply -f nginx-canary.yaml
#When the deployment is complete, verify that both the nginx and the nginx-canary deployments are present.
kubectl get deployments
#scale down the primary deployment to 0 replicas so that know after testing the canary deployment on fewer number of users and finding it worked fine will make all trrafic goes to the newer pod with newest image version .
kubectl scale --replicas=0 deployment nginx-deployment
kubectl get deployments
