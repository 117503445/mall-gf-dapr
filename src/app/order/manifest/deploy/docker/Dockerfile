FROM golang:1.18.0-alpine3.15 as build
LABEL maintainer="117503445"
RUN apk add --no-cache git
WORKDIR /root/project
COPY go.mod .
COPY go.sum .
RUN go mod download
COPY . .
WORKDIR /root/project/app/order
RUN go build -ldflags="-s -w" -o server

FROM alpine:3.15 as prod
WORKDIR /root

# https://stackoverflow.com/questions/66963068/docker-alpine-executable-binary-not-found-even-if-in-path
RUN apk add gcompat 

COPY --from=build /root/project/app/order/server server
ENTRYPOINT ./server