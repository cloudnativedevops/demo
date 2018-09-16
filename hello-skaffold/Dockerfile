FROM golang:1.11-alpine AS build

WORKDIR /go/src/github.com/cloudnativedevops/demo/
COPY main.go /go/src/github.com/cloudnativedevops/demo/
RUN CGO_ENABLED=0 go build -o /bin/demo

FROM scratch
COPY --from=build /bin/demo /bin/demo
ENTRYPOINT ["/bin/demo"]
