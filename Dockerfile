FROM alpine:3.3
RUN apk -v --update add \
        python \
        py-pip \
        groff \
        less \
        && \
    pip install --upgrade awscli s3cmd && \
    apk -v --purge del py-pip && \
    rm /var/cache/apk/*
VOLUME /root/.aws
VOLUME /project
WORKDIR /project
ENTRYPOINT ["aws"]
