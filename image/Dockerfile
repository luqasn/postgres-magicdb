FROM golang:1.17.6

RUN apt update && apt install -y postgresql-client

RUN go install github.com/luqasn/pgAuthProxy@v0.1.5

WORKDIR /proxy

ADD auth.sh auth.sh
ADD pgAuthProxy.yaml pgAuthProxy.yaml

CMD ["pgAuthProxy"]