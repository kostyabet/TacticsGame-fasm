FROM golang:1.20 AS builder
WORKDIR /app
COPY go.mod go.sum ./
RUN go get .
COPY . .
RUN go build -o tg_api .