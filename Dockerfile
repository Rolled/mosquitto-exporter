FROM golang:1.24-alpine AS build

WORKDIR /src

COPY go.mod go.sum ./
RUN go mod download

COPY . .

RUN CGO_ENABLED=0 go build -ldflags="-s -w -X main.Version=$(cat VERSION 2>/dev/null || echo dev) -X main.GITCOMMIT=$(git rev-parse --short HEAD 2>/dev/null || echo unknown)" -o /mosquitto_exporter .

FROM scratch
LABEL source_repository="https://gitlab.muir.syn-packet.com/synpacket/mosquitto-exporter"

COPY --from=build /mosquitto_exporter /mosquitto_exporter

EXPOSE 9234

ENTRYPOINT ["/mosquitto_exporter"]
