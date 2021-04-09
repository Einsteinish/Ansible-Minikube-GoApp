FROM golang:1-alpine as build
WORKDIR /app
COPY hello.go /app
RUN go build hello.go
FROM alpine:latest
WORKDIR /app
COPY --from=build /app /app
EXPOSE 8180
ENTRYPOINT ["./hello"]
