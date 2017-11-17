#!/usr/bin/env bash

docker run --rm python:alpine pip search awscli | grep "^awscli " | sed "s/awscli (\(.*\)).*/\1/"
