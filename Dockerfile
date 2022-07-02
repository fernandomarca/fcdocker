FROM golang:1.16 AS builder

WORKDIR /go/src

ENV PATH="/go/bin:${PATH}"

COPY . .

RUN GOOS=linux go build -ldflags="-s -w" -o desafio1
# ENTRYPOINT [ "./desafio1" ]

FROM scratch
# Copy our static executable.
COPY --from=builder /go/src/desafio1 /go/src/desafio1
# Run the hello binary.
ENTRYPOINT ["/go/src/desafio1"]