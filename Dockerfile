FROM alpine:3.7
MAINTAINER MR <morgan.richomme@gmail.com>

COPY requirements.txt requirements.txt

RUN apk add --no-cache python3 gcc bash  \
            python3-dev build-base linux-headers libffi-dev \
            openssl-dev libjpeg-turbo-dev && \
    python3 -m ensurepip && \
    rm -r /usr/lib/python*/ensurepip && \
    pip3 install --upgrade pip setuptools && \
    if [ ! -e /usr/bin/pip ]; then ln -s pip3 /usr/bin/pip ; fi && \
    if [[ ! -e /usr/bin/python ]]; then ln -sf /usr/bin/python3 /usr/bin/python; fi && \
    pip3 install --no-cache-dir --src /src -rrequirements.txt && \
rm -r /root/.cache requirements.txt
