# Website-Host-Using-Docker-and-Terraform

A simple website host deployed through terraform in Docker containers in AWS EC2.

Referred my personal git repo portfolio to host : https://github.com/Vighnesh-99/myportfolio.git

## Getting started

This solution uses AWS EC2, Terraform with Docker.

Run in this directory to clone git repo and copy it to docker container:

```shell
git clone https://github.com/Vighnesh-99/myportfolio.git
docker cp source_path container_id:destination_path #soruce->myportfolio destination->/apache2/htdocs/
```
