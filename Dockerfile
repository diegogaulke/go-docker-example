#####################
# MULTI STAGE BUILD #
#####################

# STEP-1 build
FROM golang:alpine AS builder

# Git is required to use dep
# Install git
RUN apk update && apk add --no-cache git

ENV GOBIN=/go/bin

ADD . /go/src/go-docker-example
WORKDIR /go/src/go-docker-example

# Install dep
RUN go get -u github.com/golang/dep/cmd/dep

# Install dependencies
RUN dep ensure

RUN CGO_ENABLED=0 go build -a -installsuffix cgo -ldflags="-w -s" -o /go/bin/go-docker-example

# STEP-2 copy the binary
FROM scratch

COPY --from=builder /go/bin/go-docker-example /go/bin/go-docker-example

# Server port

ENTRYPOINT [ "/go/bin/go-docker-example"]