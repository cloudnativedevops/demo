# Deploy the app with Helm 3

If you've worked your way through the [hello-k8s](/hello-k8s) example, you now know everything you need to know to deploy applications to Kubernetes clusters using declarative YAML manifests. But there's a lot of repetition in these files: for example, you've repeated the name `demo`, the label selector `app: demo`, and the port `8888` several times.

Shouldn't you be able to just specify those values once, and then reference them wherever they occur through the Kubernetes manifests?

For example, it would be great to be able to define variables called something like `container.name` and `container.port`, and then use them wherever they're needed in the YAML files. Then, if you needed to change the name of the app or the port number it listens on, you'd only have to change them in one place, and all the manifests would be updated automatically.

Fortunately, there's a tool for that, and in this example we'll show you a little of what it can do.

## Helm: a Kubernetes package manager

One popular package manager for Kubernetes is called Helm, and it works just the way we've described. You can use the `helm` command-line tool to install and configure applications (your own or anyone else's), and you can create packages called Helm _charts_, which completely specify the resources needed to run the application, its dependencies, and its configurable settings.

Helm is part of the Cloud Native Computing Foundation family of projects, which reflects its stability and widespread adoption.

When you install a Helm chart, Kubernetes itself will locate and download the binary container image from the place you specified. In fact, a Helm chart is really just a convenient wrapper around Kubernetes YAML manifests.

## Installing Helm

Follow the installation instructions at this site for your operating system:

https://helm.sh/docs/intro/install/

Once you have Helm installed, you will need to create some Kubernetes resources to authorize it for access to your cluster.



## Installing a Helm chart

What would the Helm chart for our demo application look like? In this directory, you'll see a [`k8s`](k8s) subdirectory, which in the previous example ([`hello-k8s`](/hello-k8s)) contained just the Kubernetes manifest files to deploy the application. Now it contains a Helm chart, in the [`demo`](k8s/demo) directory:

```
ls k8s/demo
Chart.yaml             prod-values.yaml staging-values.yaml    templates
values.yaml
```

Let's use Helm to install the demo application. First, clean up the resources from any previous deployments:

```
kubectl delete all --selector app=demo
```

Then run the following command:

```
helm install demo ./k8s/demo
NAME:   demo
LAST DEPLOYED: Wed Jun  6 10:48:50 2018
NAMESPACE: default
STATUS: DEPLOYED

RESOURCES:
==> v1/Service
NAME              TYPE       CLUSTER-IP     EXTERNAL-IP  PORT(S)   AGE
demo-service-dev  ClusterIP  10.98.231.112  <none>       9999/TCP  0s

==> v1/Deployment
NAME      DESIRED  CURRENT  UP-TO-DATE  AVAILABLE  AGE
demo-dev  1        1        1           0          0s

==> v1/Pod(related)
NAME                       READY  STATUS             RESTARTS  AGE
demo-dev-6c96484c48-69vss  0/1    ContainerCreating  0         0s
```

You can see that Helm has created a Deployment resource (which starts a Pod) and a Service, just as in the previous example. The `helm install` does this by creating a Kubernetes object called a Helm _release_.

Now you can go on to the next section: [Manage the app with Helmfile](/hello-helmfile).


## What's this?

This is a code example from the book 'Cloud Native DevOps with Kubernetes'. See the [index](/README.md) for more examples.
