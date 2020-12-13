# UdacityCapstoneSandbox
![Test Image](screenshots/test.jpg)

# Project Address
https://github.com/rgranier/UdacityCapstoneSandbox.git

# TODO

1. Eventhough I have used the "latest" tag and Alwasy for imagePullPolicy, the only
way I can get the deployment to update following a change in the html is to
delete the deployment first or use explicit tagging, which causes a problem since there
is not an obvious way to automatically tag.  

    a. 2 changes in Jenkinsfile, docker tag & push,  and K8s deploy

    b. 1 change in deployment

```
spec:
  containers:
  - name: capstone-test
    image: rgranier/capstone-test:latest
    imagePullPolicy: Always
    ports:
    - containerPort: 80
```

2. Deploy a simple flask app using templates

3.  How can I see success or the rolling deployment,
    in the EC2 console as the reviewer suggested?
---
# STEP 1: BUILD A JENKINS SERVER

- The IAC code for the Jenkins server is located in the iac directory of the source
code.
- I want to build a server in a public network without any complications with private networks or load balancers.  
- I want to be able to access via a public IP.
- I will want to open only the ports I will need: 22, 80, 8080
- Minikube is installed locally, but for this project code is pushed directly to
Git Hub and then the pipeline steps begin.
- I did not install a virtual environment, but that could be in option.

Additional program needs to be installed:

- Docker
- Jenkins
- All Jenkins plugins, plus Blue Ocean
- tidy
- python3 and pip3
- pylint
- hadolint

# STEP 2:  Set up roles
AWS role:  granier-k8-super
This must be put in Jenkins.

Docker Credentials:  Docker credentials must be put in Jenkins

TODO:  This role was set up with lots of access.  Can it be reduced?  

# STEP 3: Setup a Git Hub Repo & Set Up a Docker Hub Repo

## Project Address
https://github.com/rgranier/UdacityCapstoneSandbox.git


# STEP 4:  EKS deployment

Use the following command to deploy the EKS cluster.   
```
eksctl create cluster \
--name granier-dev \
--version 1.16 \
--region us-west-2 \
--nodegroup-name standard-workers \
--node-type t3.micro \
--nodes 3 \
--nodes-min 1 \
--nodes-max 4 \
--managed
```

**Results**

![EKS Results](screenshots/eks.JPG)

## EC2 Console Screenshot: Following deployment
The screenshots below represent  the EC2 console following a Rolling Deployment.
![EC2 Following Deployment](screenshots/ec2console1.jpg)


# STEP 5:  Jenkins Pipeline Complete Success

## Jenkins Success
The screenshots below represent  the Jenkins pipeline  following a successful Rolling Deployment.
![Jenkins Success 1](screenshots/jenkins-success-1.JPG)
![Jenkins Success 2](screenshots/jenkins-success-2.JPG)


## Lint Python success
The screenshots below represent  the Jenkins pipeline  following a successful Rolling Deployment
with a successful Linting step.
![Pylint Success](screenshots/lint-python-success.JPG)

## Lint Python Failure (to show that Lint is working)
The screenshots below represent  the Jenkins pipeline  following a failed Rolling Deployment
with a failed  Linting step.
![Pylint Failure](screenshots/lint-python-fail.JPG)
# travelweb
