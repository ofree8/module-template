FROM golang:alpine AS build-env

COPY main.go /src/

RUN cd /src && CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o app

# final stage
FROM alpine
COPY --from=build-env /src/app /
ENTRYPOINT ["/app"]

