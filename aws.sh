#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

# enable interruption signal handling
trap - INT TERM

docker run --rm \
        "$(tty >/dev/null 2>&1 && printf -- '-ti' || printf -- '-t' )" \
        -v "${AWS_SHARED_CREDENTIALS_FILE:-$HOME/.aws}:${AWS_SHARED_CREDENTIALS_FILE:-/root/.aws}" \
        -v "$(pwd):$(pwd)" \
        ${AWS_ACCESS_KEY_ID:+                 -e "AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID"} \
        ${AWS_SECRET_ACCESS_KEY:+             -e "AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY"} \
        ${AWS_SESSION_TOKEN:+                 -e "AWS_SESSION_TOKEN=$AWS_SESSION_TOKEN"} \
        ${AWS_METADATA_SERVICE_TIMEOUT:+      -e "AWS_METADATA_SERVICE_TIMEOUT=$AWS_METADATA_SERVICE_TIMEOUT"} \
        ${AWS_METADATA_SERVICE_NUM_ATTEMPTS:+ -e "AWS_METADATA_SERVICE_NUM_ATTEMPTS=$AWS_METADATA_SERVICE_NUM_ATTEMPTS"} \
        ${AWS_SHARED_CREDENTIALS_FILE:+       -e "AWS_SHARED_CREDENTIALS_FILE=$AWS_SHARED_CREDENTIALS_FILE"} \
        ${AWS_PROFILE:+                       -e "AWS_PROFILE=$AWS_PROFILE"} \
        ${AWS_DEFAULT_REGION:+                -e "AWS_DEFAULT_REGION=$AWS_DEFAULT_REGION"} \
        ${AWS_DEFAULT_OUTPUT:+                -e "AWS_DEFAULT_OUTPUT=$AWS_DEFAULT_OUTPUT"} \
        ${AWS_CA_BUNDLE:+                     -e "AWS_CA_BUNDLE=$AWS_CA_BUNDLE"} \
        -w "$(pwd)" \
        mesosphere/aws-cli \
        "$@"
