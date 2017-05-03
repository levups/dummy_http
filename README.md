[![Build Status](https://travis-ci.org/levups/dummy_http.svg?branch=master)](https://travis-ci.org/levups/dummy_http)

# Dummy HTTP

Simple HTTP server app written in Crystal using Kemal framework.

HTTP Dummy can be used to test your app against very basic HTTP responses (HTTP status 200, 404, 500, etc.) but also more complex scenarios like infinite redirect, local redirect or other domain redirect. 

## Installation

A Makefile is included in this project so you can simply run this command to install all dependencies on macOS :

```shell
make setup
```

If you need to install manually, install Crystal language then all dependencies (libraries):

```shell
crystal deps
```

## Usage

Build the application:

```shell
make release
```

Run the application, listening by default on TCP port 3000:

```shell
./dummy
```

You can specify a specific port:

```shell
./dummy --port 4242
```

## Development

Run tests:

```shell
KEMAL_ENV=test crystal spec
```

Start the application:

```shell
crystal run src/dummy_http.cr
```

Build (compile) without optimizations:

```shell
crystal build src/dummy_http.cr
```

Build (compile) for release, with optimizations:

```shell
crystal build --release src/dummy_http.cr
```

## Contributing

1. Fork it ( https://github.com/levups/http_dummy_crystal/fork )
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request

## Contributors

- [czj](https://github.com/czj) Clément Joubert - creator, maintainer
