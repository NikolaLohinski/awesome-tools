# Docker

## Use Cloud SQL with the google proxy side container
In order to proxify a cloudSQL POSTGRES instance in a sideContainer, you will need a service account with one of this roles :
* Cloud SQL > Cloud SQL Client
* Cloud SQL > Cloud SQL Editor
* Cloud SQL > Cloud SQL Admin

Once this service account is created, you will need a service-account key to be available locally. To generate one, 
go to the IAM page of this service account (GCP console > IAM & admin > Service accounts), generate one and download it.

Retrieve the Instance Connection Name field: 
* Go to GCP console > SQL
* Select the instance you want to access to
* In the `Overview` tab, the `Instance Connection Name` field is under the `Connect to this instance` section.

Open a terminal and define the following variables:
* DIR_PATH_CREDENTIALS: local path to the directory containing the credentials you just generated and downloaded
* INSTANCE_NAME: the instance connection name you just found in the GCP console
* CREDENTIALS: name of the credentials file
For example:
``` 
$ export DIR_PATH_CREDENTIALS=/home/you/Downloads
$ export INSTANCE_NAME=my-awesome-project:europe-west1:database-instance-id
$ export CREDENTIALS=service-account-credentials.json
```
Start the cloud SQL proxy container:
```
$ docker run -p 127.0.0.1:5432:5432 --name cloud-sql-proxy -v ${DIR_PATH_CREDENTIALS}:/opt b.gcr.io/cloudsql-docker/gce-proxy /cloud_sql_proxy -instances=${INSTANCE_NAME}=tcp:0.0.0.0:5432 -credential_file=/opt/${CREDENTIALS}
```