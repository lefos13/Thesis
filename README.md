# System and Service Monitoring and Analysis in a Cloud Environment with Services based on Containers

## Requirements

1. Docker
2. Npm - node
3. Vue CLI

## Installation Process
```
git clone <insert_git_project_url>
cd Thesis
chmod 700 install.sh
./install.sh
```
## Run Web-client
```
./runw.sh
```
## Run the rest services
```
docker-compose up
```

...and you are done.

### You can access the web-client on and monitor some logs:
>http://localhost:8080

## Add your own Service to the system
All you have to do is add it to the docker-compose file or run it afterwords with a simple docker run command. You need to configure the logging driver though. Example:
```
docker run --network="thesis_playground-net" --log-driver=fluentd --log-opt tag="mongo.node3" -p 3003:3001 dummyservice
```

You will need to mention a tag as "mongo.whateveryouwant" to be able to see your logs. If your service is a **mongoDB**, a **nodejs** app, or a **redis** you can pick the right tag so you can see your logs. Tags that are already known to the app are "mongo.node", "mongo.redis", "mongo.mongo"

## IMPORTANT if you run this localy.
For the web-client to run you will need to visit https://api-login.swarmlab.io:8089/ and login with your credentials so you will get a token. The token is visible in the url after your login.

Then, you will need to copy the url and paste it into the file runLlo.vue, which is into playground-client/src/components/doclive/

The line of code that needs to be replaced is the line 690 where you can see a url string. Replace it with your url and save it. The project will refresh and now you will be able to use the web-client.

## Ansible Deployment for Swarlab-Hybrid (not finished)
An extra deployment method is currently under development so the files:
```
mongo.yml

monitorall.yml.sh

node.yml

inventory.yml
```
are to be ignored completely at the moment.

## Important files for those who are interested

### Playground-client
First of all, the web-client is a basic vue.js project.