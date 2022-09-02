## Building the project

```sh
export NODE_OPTIONS=--openssl-legacy-provider # This is a workaround which may cause security issues. Remove this when the packages are updated
make build-frontend
CGO_ENABLED=0 go build
```