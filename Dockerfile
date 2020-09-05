
ARG GIT_REF=master
FROM k8s.gcr.io/debian-base:v1.0.0 as builder

WORKDIR /dsvpn

RUN set -x \
    && clean-install clang git ca-certificates make \
    && git clone --depth=1 https://github.com/jedisct1/dsvpn /dsvpn  \
    && git checkout ${GIT_REF} && make

# For security, we use kubernetes community maintained debian base image.
# https://github.com/kubernetes/kubernetes/blob/master/build/debian-base/
FROM k8s.gcr.io/debian-base:v1.0.0
