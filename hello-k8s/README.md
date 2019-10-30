# Deploy the app to Kubernetes using kubectl

To use the full power of Kubernetes as a declarative infrastructure as code system, you can submit YAML manifests to the cluster yourself, using the `kubectl apply` command.

## Deployments

Here's the Deployment manifest for our demo app:

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: demo
  labels:
    app: demo
spec:
  replicas: 1
  selector:
    matchLabels:
      app: demo
  template:
    metadata:
      labels:
        app: demo
    spec:
      containers:
        - name: demo
          image: cloudnatived/demo:hello
          ports:
          - containerPort: 8888
```

At first glance, this looks complicated, but it's mostly boilerplate. The only interesting parts are the same information that you've already seen in various forms: the container image name and port.

## Using `kubectl apply`

Try the following commands in this directory:

```
kubectl apply -f k8s/deployment.yaml
deployment.apps "demo" created
```

After a few seconds, a `demo` pod should be running:

```
kubectl get pods --selector app=demo
NAME                    READY     STATUS    RESTARTS   AGE
demo-6d99bf474d-z9zv6   1/1       Running   0          2m
```

We're not quite done, though, because in order to connect to the `demo` pod with a web browser, we're going to create a Service, which is a Kubernetes resource that lets you connect to your deployed Pods.

First, let's explore what a Service is, and why we need one.

## Service resources

Suppose you want to make a network connection to a Pod (such as our example application). How do you do that? You could find out the Pod's IP address and connect directly to that address and the app's port number. But the IP address may change when the Pod is restarted, so you'll have to keep looking it up to make sure it's up to date.

Worse, there may be multiple replicas of the Pod, each with different addresses. Every other application which needs to contact the Pod would have to maintain a list of those addresses, which doesn't sound like a great idea.

Fortunately, there's a better way: a Service resource gives you a single, unchanging IP address or DNS name which will be automatically routed to any matching Pod.

Here's the YAML manifest of the Service for our demo app:

```yaml
apiVersion: v1
kind: Service
metadata:
  name: demo
  labels:
    app: demo
spec:
  ports:
  - port: 9999
    protocol: TCP
    targetPort: 8888
  selector:
    app: demo
  type: ClusterIP
```

You can see that it looks somewhat similar to the Deployment resource we showed earlier. However, the `kind` is `Service`, instead of `Deployment`, and the `spec` just includes a list of `ports`, plus a `selector` and a `type`.

Go ahead and apply the manifest now, to create the Service:

```
kubectl apply -f k8s/service.yaml
service "demo" created

kubectl port-forward service/demo 9999:8888
Forwarding from 127.0.0.1:9999 -> 8888
Forwarding from [::1]:9999 -> 8888
```

`kubectl port-forward` will connect the `demo` service to a port on your local machine, so that you can call it with your web browser:

http://localhost:9999/

Once you're satisfied that everything is working correctly, run the following command to clean up before moving on to the next section.

```
kubectl delete -f k8s/
```

Now you can go on to the next section: [Deploy the app with Helm](/hello-helm).

## What's this?

This is a code example from the book 'Cloud Native DevOps with Kubernetes'. See the [index](/README.md) for more examples.
