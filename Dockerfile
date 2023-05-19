# Stage 1 - build
FROM golang:1.20 AS builder

RUN go version

ARG PROJECT_VERSION

COPY . /go/src/
WORKDIR /go/src
RUN set -Eeux && \
    go mod download && \
    go mod verify

RUN CGO_ENABLED=0 go build -trimpath -ldflags="-w -s -X 'main.Version=${PROJECT_VERSION}'"
RUN go test -cover -v ./...

# Stage 2 - alpine image
FROM alpine:3

COPY --from=builder /go/src/gh-workflows /
ENTRYPOINT "/gh-workflows"