# kubernetes-deployments-on-GKE
kubernetes cluster , service and canary deployments on GKE 
## prequisites: 
gcp account

### Scenario :
* Run **run_cloud_shell.sh** which will deploy first a cluster with 3 nodes containg nginx container running old image version then deploy loadbalancer service for it and make loadbalancer selector point for the nginx label and then create canary deployment by deploying 1 node only with new app version and specifying same label of app nginx so now loadbalancer is routing traffic to 4 nodes 3 of them of the cluster of the old version and one with the new version to test the newer version, wait till you make sure no errors and then delete the old deployment so only the new version is being used 

* Canary deployments are a pattern for rolling out releases to a subset of users or servers. The idea is to first deploy the change to a small subset of servers, test it, and then roll the change out to the rest of the servers.

* The canary deployment has fewer replicas (Pods) than the normal deployment, and thus it is available to fewer users than the normal deployment.
#### proven steps:
1. cluster created

![Screenshot from 2020-11-08 14-07-26](https://user-images.githubusercontent.com/68178003/100540151-2da6c080-3244-11eb-883e-143e58f50e3c.png)

2.applying service and canary deployment

![Screenshot from 2020-11-08 14-16-17](https://user-images.githubusercontent.com/68178003/100540155-31d2de00-3244-11eb-9967-850e6d05b493.png)

3.removing nodes of the old version app 

![Screenshot from 2020-11-08 14-17-28](https://user-images.githubusercontent.com/68178003/100540160-34cdce80-3244-11eb-8487-945971f8a689.png)

![Screenshot from 2020-11-08 14-18-09](https://user-images.githubusercontent.com/68178003/100540162-37c8bf00-3244-11eb-847d-4c6fddae6b90.png)
