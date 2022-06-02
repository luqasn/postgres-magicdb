FROM golang:1.17.6

RUN apt update && apt install -y postgresql-client

RUN go install github.com/KnifeMaster007/pgAuthProxy@0.1.2

WORKDIR /proxy

ADD start.sh start.sh
ADD auth.sh auth.sh
ADD pgAuthProxy.yaml pgAuthProxy.yaml

CMD ["pgAuthProxy"]

ENTRYPOINT ["./start.sh"]