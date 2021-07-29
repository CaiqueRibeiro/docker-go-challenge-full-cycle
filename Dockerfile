FROM golang:1.16 AS builder

WORKDIR /go/src
ENV PATH="/go/bin:${PATH}"

COPY . .

RUN go build -o /go/bin/main

FROM scratch
COPY --from=builder /go/bin/main /go/bin/main

ENTRYPOINT [ "go/bin/main" ]