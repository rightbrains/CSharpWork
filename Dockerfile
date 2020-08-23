
ARG GIT_REF=master
FROM k8s.gcr.io/debian-base:v1.0.0 as builder

WORKDIR /dsvpn