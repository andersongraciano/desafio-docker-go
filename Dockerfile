FROM golang:1.18.0-alpine3.15 as builder

RUN mkdir /app

COPY codeeducation.go /app/.

WORKDIR /app

RUN go build codeeducation.go

FROM scratch

COPY --from=builder /app/codeeducation /

CMD ["/codeeducation"]