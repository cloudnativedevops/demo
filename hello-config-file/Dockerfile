FROM golang:1.10.2-alpine3.7 AS build

WORKDIR /go/src/github.com/cloudnativedevops/demo/
RUN apk --no-cache add --update git
RUN go get -u gopkg.in/yaml.v2
COPY main.go /go/src/github.com/cloudnativedevops/demo/
RUN CGO_ENABLED=0 go build -o /bin/demo

FROM scratch
COPY --from=build /bin/demo /bin/demo
ENTRYPOINT ["/bin/demo"]
