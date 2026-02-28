# Mosquitto Exporter

Prometheus exporter for the [Mosquitto MQTT message broker](https://mosquitto.org/).

This is a fork of [sapcc/mosquitto-exporter](https://github.com/sapcc/mosquitto-exporter) (v0.8.0), originally created by Arturo Reuschenbach Puncernau and Fabian Ruff at SAP. The upstream project is no longer maintained (last release October 2021). This fork rebuilds with a modern Go toolchain to eliminate known CVEs from the outdated Go 1.17 stdlib.

## Changes from upstream

- Go 1.14/1.17 -> 1.24
- `codegangsta/cli` -> `urfave/cli/v2` (deprecated library replacement)
- `paho.mqtt.golang` v1.3.5 -> v1.5.0
- `prometheus/client_golang` v1.11.0 -> v1.21.1
- Dockerfile: `golang:1.17-buster` -> `golang:1.24-alpine`
- GitLab CI pipeline for automated builds

## Usage

```
docker run \
  -p 9234:9234 registry.muir.syn-packet.com/synpacket/mosquitto-exporter:latest \
  --endpoint tcp://mosquitto:1883
```

```
NAME:
   Mosquitto exporter - Prometheus exporter for broker metrics

USAGE:
   mosquitto_exporter [global options] command [command options] [arguments...]

AUTHORS:
   Arturo Reuschenbach Puncernau <a.reuschenbach.puncernau@sap.com>
   Fabian Ruff <fabian.ruff@sap.com>

GLOBAL OPTIONS:
   --endpoint value, -e value      Endpoint for the Mosquitto message broker (default: "tcp://127.0.0.1:1883") [$BROKER_ENDPOINT]
   --bind-address value, -b value  Listen address for metrics HTTP endpoint (default: "0.0.0.0:9234") [$BIND_ADDRESS]
   --user value, -u value          Username for the Mosquitto message broker [$MQTT_USER]
   --pass value, -p value          Password for the User on the Mosquitto message broker [$MQTT_PASS]
   --cert value, -c value          Location of a TLS certificate .pem file for the Mosquitto message broker [$MQTT_CERT]
   --key value, -k value           Location of a TLS private key .pem file for the Mosquitto message broker [$MQTT_KEY]
   --client-id value, -i value     Client id to be used to connect to the Mosquitto message broker [$MQTT_CLIENT_ID]
   --help, -h                      show help
   --version, -v                   print the version
```

## License

Apache 2.0 - see [LICENSE](LICENSE) (inherited from upstream).

## Original Authors

- Arturo Reuschenbach Puncernau (SAP)
- Fabian Ruff (SAP)
