FROM golang:1.17-alpine AS build

WORKDIR /src/
RUN apk --no-cache add --update git
COPY main.go go.* /src/
RUN CGO_ENABLED=0 go build -o /bin/demo

FROM scratch
COPY --from=build /bin/demo /bin/demo
ENTRYPOINT ["/bin/demo"]
