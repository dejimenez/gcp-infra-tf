ORG_ID=org_id
PROJECT_ID=infra-${RANDOM}
BILLING_ACCOUNT=billing_account_id

gcloud projects create ${PROJECT_ID} \
    --organization ${ORG_ID} \
    --set-as-default

gcloud beta billing projects link ${PROJECT_ID} \
    --billing-account ${BILLING_ACCOUNT}

gcloud iam service-accounts create terraform \
    --display-name "Terraform cloud account"

gcloud auth application-default login // authenticate and save credentials locally to run the rest of the commands 

gcloud services enable compute.googleapis.com // enable the api to create compute engine vms