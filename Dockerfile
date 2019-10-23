FROM openjdk:8-jre-alpine as builder
RUN apk add --no-cache curl
RUN curl -s -Lo coursier https://git.io/coursier-cli && \
    chmod +x coursier && \
    mv ./coursier /usr/local/bin

ARG SCALAFMT_VERSION=2.2.1
RUN coursier bootstrap org.scalameta:scalafmt-cli_2.12:${SCALAFMT_VERSION} \
    -r sonatype:snapshots \
    -o /usr/local/bin/scalafmt --standalone --main org.scalafmt.cli.Cli

FROM openjdk:8-jre-alpine
COPY --from=builder /usr/local/bin/scalafmt /usr/local/bin/scalafmt
ENTRYPOINT ["/usr/local/bin/scalafmt"]
