FROM debian:11.5-slim
LABEL MAINTAINER="liyang@easycorp.ltd"

ENV OS_ARCH="amd64" \
    OS_NAME="debian-11" \
    HOME_PAGE="alist.nn.ci"

ENV TZ=Asia/Shanghai

ENV ALIST_ADMIN_PASSWORD=qucheng123


RUN apt-get update \
    && apt-get -y install ca-certificates curl gzip 

ARG VERSION
ENV EASYSOFT_APP_NAME="Alist $VERSION"

RUN mkdir -pv /apps/alist \
    && cd /apps/alist \
    && curl -sLk -o alist.tar.gz https://github.com/alist-org/alist/releases/download/v${VERSION}/alist-linux-amd64.tar.gz \
    && tar xvzf alist.tar.gz \
    && rm -rf alist.tar.gz

VOLUME /apps/alist/data/
WORKDIR /apps/alist/

EXPOSE 5244
CMD [ "/apps/alist/alist", "server", "--no-prefix" ]
