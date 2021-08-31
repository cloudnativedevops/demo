# Build and run the demo application

Our demo application is written in the Go programming language.

Go is a modern programming language (developed at Google since 2009) which prioritizes simplicity, safety, and readability, and is designed for building large-scale concurrent applications, especially network services. It's also a lot of fun to program in.

Kubernetes itself is written in Go, as are Docker, Terraform, and many other popular open source projects. This makes Go a good choice for developing cloud native applications.

## How the demo app works

As you can see, the [demo app](main.go) is pretty simple, even though it implements an HTTP server (Go comes with a powerful standard library). The core of it is this function, called `handler`:

```go
func handler(w http.ResponseWriter, r *http.Request) {
        fmt.Fprintln(w, "Hello, 世界")
}
```

As the name suggests, it handles HTTP requests. The request is passed in as an argument to the function (though the function doesn't do anything with it, yet).

An HTTP server also needs a way to send something back to the client. The `http.ResponseWriter` object enables our function to send a message back to the user to display in her browser: in this case, just the string `Hello, 世界`.

The first example program in any language traditionally prints `Hello, world`. But because Go natively supports Unicode (the international standard for text representation), example Go programs often print `Hello, 世界` instead, just to show off. If you don't happen to speak Chinese, that's okay: Go does!

The rest of the program takes care of registering the `handler` function as the handler for HTTP requests, and actually starting the HTTP server to listen and serve on port 8888.

That's the whole app! It doesn't do much yet, but we will add capabilities to it as we go on.

## Building a container

You know that a container image is a single file that contains everything the container needs to run, but how do you build an image in the first place? Well, to do that, you use the `docker image build` command, which takes as input a special text file called a _Dockerfile_. The Dockerfile specifies exactly what needs to go into the container image.

One of the key benefits of containers is the ability to build on existing images to create new images. For example, you could take a container image containing the complete Ubuntu operating system, add a single file to it, and the result will be a new image.

In general, a Dockerfile has instructions for taking a starting image (a so-called _base image_), transforming it in some way, and saving the result as a new image.

## Understanding Dockerfiles

Let's see the [Dockerfile](Dockerfile) for our demo application:

```dockerfile
FROM golang:1.17-alpine AS build

WORKDIR /src/
COPY main.go go.* /src/
RUN CGO_ENABLED=0 go build -o /bin/demo

FROM scratch
COPY --from=build /bin/demo /bin/demo
ENTRYPOINT ["/bin/demo"]
```

The exact details of how this works don't matter for now, but it uses a fairly standard build process for Go containers called _multi-stage builds_. The first stage starts from an official `golang` container image, which is just an operating system (in this case Alpine Linux) with the Go language environment installed. It runs the `go build` command to compile the `main.go` file we saw earlier.

The result of this is an executable binary file named `demo`. The second stage takes a completely empty container image (called a _scratch_ image, as in 'from scratch') and copies the `demo` binary into it.

## Installing Docker Desktop

Docker Desktop is a complete Kubernetes development environment that runs on your laptop (or desktop). It includes a single-node Kubernetes cluster that you can use to test your applications.

Let's install Docker Desktop now and use it to run a simple containerized application. If you already have Docker installed, skip this section.

Download a version of the Docker Desktop Community Edition suitable for your computer here:

https://store.docker.com/search?type=edition&offering=community

Follow the instructions for your platform to install Docker and start it up. Once you've done that, you should be able to open a terminal and run the following command:

```
docker version
Client:
 Version:      18.03.1-ce
 ...
```

The exact output will be different depending on your platform, but if Docker is correctly installed and running, you'll see something like the example output shown. On Linux systems you may need to run `sudo docker version` instead.

## Running 'docker image build'

We've seen that the Dockerfile contains instructions for the `docker image build` tool to turn our Go source code into an executable container. Let's go ahead and try it. In this directory, run the following command:

```bash
docker image build -t myhello .
Sending build context to Docker daemon  4.096kB
Step 1/7 : FROM golang:1.17-alpine AS build
...
Successfully built eeb7d1c2e2b7
Successfully tagged myhello:latest
```

Congratulations, you just built your first container! You can see from the output that Docker performs each of the actions in the Dockerfile in sequence on the newly-formed container, resulting in an image that's ready to use.

## Naming your images

When you build an image, by default it just gets a hexadecimal ID, which you can use to refer to it later (for example, to run it). These IDs aren't particularly memorable or easy to type, so Docker allows you to give the image a human-readable name, using the `-t` switch to `docker image build`. In the previous example you named the image `myhello`, so you should be able to use that name to run the image now.

Let's see if it works:

```
docker container run -p 9999:8888 myhello
```

You're now running your own copy of the demo application, and you can check it by browsing to the same URL as before:

http://localhost:9999/

You should see `Hello, 世界`. When you're done running this image, press Ctrl-C to stop the `docker container run` command.

## Exercise

If you're feeling adventurous, modify the `main.go` file in the demo application and change the greeting so that it says "Hello, world" in your favorite language (or change it to say whatever you like). Rebuild the container and run it to check that it works.

Congratulations, you're now a Go programmer! But don't stop there: take the interactive Tour of Go to learn more:

https://tour.golang.org/welcome/1

Now you can go on to the next section: [Deploy the app to Kubernetes using kubectl](/hello-k8s).

## What's this?

This is a code example from the book 'Cloud Native DevOps with Kubernetes'. See the [index](/README.md) for more examples.