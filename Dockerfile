FROM golang:1.10.1-alpine3.7 AS build

WORKDIR /go/src/github.com/cloudnativedevops/cloudnatived/
COPY main.go /go/src/github.com/cloudnativedevops/cloudnatived/
RUN CGO_ENABLED=0 go build -o /bin/cloudnatived

FROM scratch
COPY --from=build /bin/cloudnatived /bin/cloudnatived
ENTRYPOINT ["/bin/cloudnatived"]
