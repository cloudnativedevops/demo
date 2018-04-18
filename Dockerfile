FROM golang:1.10.1-alpine3.7 AS build

WORKDIR /go/src/github.com/cloudnativedevops/cloudnatived/
COPY . /go/src/github.com/cloudnativedevops/cloudnatived/
RUN go build -o /bin/cloudnatived

FROM scratch
COPY --from=build /bin/cloudnatived /bin/cloudnatived
ENTRYPOINT ["/bin/cloudnatived"]
