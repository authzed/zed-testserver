# zed-testserver

Binary for easy unit and integration testing of applications using the [Authzed API](https://docs.authzed.com/api/overview).

## Installation

Download the latest binary from the [Releases](https://github.com/authzed/zed-testserver/releases).

## Overview

The `zed-testserver` runs a local in-memory version of the Authzed API, exposed by default on port `50051` and **without TLS**.

## Usage

### Example

```sh
./zed-testserver-linux-amd64 run --load-configs=path/to/default/namespaces/and/tuples.yaml

INF set log level new level=info
INF gRPC server started listening addr=:50051
```

### Arguments

| Argument    | Description |
| ----------- | ----------- |
| `grpc-addr` | The gRPC at which to bind the local server (default: `50051`) |
| `load-configs` | If specified, the file path(s) of [Authzed Playground](https://play.authzed.com) produced YAMLs to load |
| `log-level` | The log level of the server (default: `info`) |
| `json` | If true, logs will be output in JSON format (default: `false`) |

## Prepopulating

`zed-testserver` supports prepopulating the in-memory API with [namespaces](https://docs.authzed.com/concept/namespaces) and [tuples](https://docs.authzed.com/concept/tuples) via the `--load-configs` parameter.

The `--load-configs` parameter accepts zero (or more) YAML files as produced by the **Save** operation in the [Authzed Playground](https://play.authzed.com).

Any namespaces and test tuples defined in the YAML will be loaded into the in-memory API.

## Tokens

Using tokens when calling the API as exposed by `zed-testserver` is **optional**.

If a token is specified, an **isolated data model** is created for that token, and maintained for the lifetime of the run of the `zed-testserver`.

This allows code being tested to easily instantiate a new testing environment for each test by **sending a new token per test**, without having to rerun `zed-testserver`.

Note that if `--load-configs` is specified, the namespaces and tuples found within will be loaded *for each isolated data model*.
