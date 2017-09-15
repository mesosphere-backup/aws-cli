FROM alpine:3.6
RUN apk -v --no-cache add \
        python \
        py-pip \
        groff \
        less \
        mailcap \
        && \
    pip install --upgrade awscli s3cmd python-magic && \
    apk -v --purge del py-pip
VOLUME /root/.aws
VOLUME /project
WORKDIR /project
ENTRYPOINT ["aws"]
