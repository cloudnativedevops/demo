# Cloud Native DevOps with Kubernetes

![Cloud Native DevOps cover image](/img/cover.jpg)

Welcome! This is the example code repository to accompany the book 'Cloud Native DevOps with Kubernetes', by John Arundel and Justin Domingus. Buy the book here:

* [Amazon US](https://amzn.to/2PEPTjc)

* [Amazon UK](https://amzn.to/2PGkZa0)

* [O'Reilly](http://shop.oreilly.com/product/0636920175131.do)

## About the book

From the preface:

> You'll learn what Kubernetes is, where it comes from, and what it means for the future of software development and operations. You'll learn how containers work, how to build and manage them, and how to design cloud native services and infrastructure.

> You'll understand the trade-offs between building and hosting Kubernetes clusters yourself, and using managed services. You'll learn the capabilities, limitations, and pros and cons of popular Kubernetes installation tools such as kops, `kubeadm`, and Kubespray. You'll get an informed overview of the major managed Kubernetes offerings from the likes of Amazon, Google, and Microsoft.

> You'll get hands-on practical experience of writing and deploying Kubernetes applications, configuring and operating Kubernetes clusters, and automating cloud infrastructure and deployments with tools such as Helm. You'll learn about Kubernetes support for security, authentication, and permissions, including Role-Based Access Control (RBAC), and best practices for securing containers and Kubernetes in production.

> You'll learn how to set up continuous integration and deployment with Kubernetes, how to back up and restore data, how to test your cluster for conformance and reliability, how to monitor, trace, log, and aggregate metrics, and how to make your Kubernetes infrastructure scalable, resilient, and cost-effective.

The book aims to teach you everything you need to know to deploy, run, and scale applications in Kubernetes, and most importantly, to give you working example code for everything we demonstrate. That code is open source, available for free for you to use and adapt whether or not you buy the book. And here it is!

## Show me the code

Almost all the example code involves our 'hello world' demo application. Here is the list of examples; follow the links to see the documentation on each example.

* [Build and run the demo application locally](/hello)
* Build a container image for the application
* Deploy the app to Kubernetes using YAML manifests
* Deploy the app with Helm
* Manage the app with Helmfile
* Set up a namespace, resource requests, and limits for the app
* Add config data to the app's environment
* Pass config data to the app's command line
* Mount a config file in the container at runtime
* Add secret data to the app's environment
* Mount a secrets file in the container
* Store encrypted secrets in the app repo, decrypted automatically on deploy
* Develop the app locally with Skaffold
* Build and deploy the app automatically with Drone
* Build and deploy the app automatically with Google Cloud Build

We also include some Terraform code examples, for both Amazon AWS and Google Cloud, to help you manage cloud resources with code:

* Create a cloud storage bucket in code
* Create a cloud database instance in code
* Create a cloud virtual machine instance in code
* Create a Kubernetes cluster in code

## You will need

To build and run all of these examples, you will need:

* Go version 1.11 or above
* Docker version 18.03 or above

Where you need other tools for specific examples, we'll mention that in the README for the example.
