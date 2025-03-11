FROM golang:1.21 AS builder

WORKDIR /app

COPY . .

RUN if [ -f go.mod ]; then sed -i 's/go 1.21.0/go 1.21/g' go.mod; fi && \
    if [ ! -f go.mod ]; then go mod init app; fi && \
    go mod tidy && \
    CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -ldflags="-s -w" -o server main.go

FROM ubuntu:24.04
LABEL authors="yidgar"

WORKDIR /app

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    ca-certificates \
    dnsutils \
    iputils-ping \
    net-tools \
    curl && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

COPY --from=builder /app/server /app/

EXPOSE 9090

CMD ["./server", "redis-container-service:6379"]