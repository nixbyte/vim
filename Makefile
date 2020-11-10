CGO_ENABLED=0

GOPATH=${CURDIR}:${CURDIR}/vendor

b build:
	go build -o bin/yin src/main.go

bl:
	GOOS=linux GOARCH=amd64 go build -o bin/yin src/main.go

f:
	gofmt -l -s -w `find . -type f -name '*.go' -not -path "./vendor/*"`
