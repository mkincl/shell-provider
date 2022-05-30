FROM alpine:3.16

RUN apk add --no-cache \
    git=2.36.1-r0 \
    make=4.3-r0

# hadolint ignore=DL3059
RUN apk add --no-cache \
    shellcheck=0.8.0-r0 \
    shfmt=3.5.0-r0
