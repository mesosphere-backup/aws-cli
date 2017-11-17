#!/usr/bin/env bash

docker run --rm python:alpine pip search s3cmd | grep "^s3cmd " | sed "s/s3cmd (\(.*\)).*/\1/"
