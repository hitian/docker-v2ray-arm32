FROM alpine as builder
ENV ARCH "linux-arm"
ENV VERSION "v3.25.1"

ADD https://github.com/v2ray/v2ray-core/releases/download/${VERSION}/v2ray-${ARCH}.zip v2ray.zip
RUN unzip v2ray.zip

FROM arm32v6/alpine:latest
ENV ARCH "linux-arm"
ENV VERSION "v3.25.1"

COPY --from=builder v2ray-${VERSION}-${ARCH}  /usr/bin/v2ray
ENV PATH /usr/bin/v2ray/:$PATH
CMD ["v2ray", "-h"]
