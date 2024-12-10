FROM golang:1.20 AS builder
WORKDIR /app/Server/DataBaseAPI
COPY Server/DataBaseAPI/go.mod Server/DataBaseAPI/go.sum ./
RUN go get .
COPY Server/DataBaseAPI/ .
RUN go build -o tg_api .