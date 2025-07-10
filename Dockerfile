FROM debian:bookworm-slim

RUN curl https://downloads.codescene.io/enterprise/cli/install-cs-coverage-tool.sh | bash -s -- -y

COPY pipe.sh .

ENTRYPOINT ["./pipe.sh"]
