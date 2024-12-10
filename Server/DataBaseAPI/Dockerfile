FROM golang:1.20 AS builder
WORKDIR /app/Server/DataBaseAPI
COPY Server/DataBaseAPI/go.mod Server/DataBaseAPI/go.sum ./
RUN go mod download
COPY Server/DataBaseAPI/ .
RUN go build -o tg_api .