FROM golang AS builder

WORKDIR /app
COPY main.go ./
RUN go build main.go

FROM ubuntu:21.04

WORKDIR /app
COPY --from=builder /app ./
ENTRYPOINT [ "./main" ]
EXPOSE 8080
