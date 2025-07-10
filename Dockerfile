FROM debian:bookworm-slim

RUN apt update && apt install -y curl unzip && rm -rf /var/lib/apt/lists/*
RUN curl https://downloads.codescene.io/enterprise/cli/install-cs-coverage-tool.sh | bash -s -- -y

COPY pipe.sh .

ENTRYPOINT ["./pipe.sh"]
