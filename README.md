# alpine-node-yarn-install-gcloud-kubectl
Lightweight yarn docker image on alpine with gcloud, kubectl & npm installation on build

## NodeJS
version: 16.13.1

## NPM
version: 8.3.0

## Yarn
version: 1.22.17

## gcloud
Google Cloud SDK 388.0.0  
bq 2.0.74  
core 2022.05.27  
gsutil 5.10  
gke-gcloud-auth-plugin 0.2.0  

## kubectl
version: 1.21.9  

# How to use
set envs:
1. GCP_ACCOUNT=example@example-project.iam.gserviceaccount.com
2. GCP_KEY_FILE=example_gcp_key.json
3. GCP_PROJECT=example_project_id
