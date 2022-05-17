FROM alpine:3

RUN apk add --no-cache \
    git=2.34.2-r0 \
    make=4.3-r0

# hadolint ignore=DL3059
RUN apk add --no-cache \
    shellcheck=0.7.2-r2 \
    shfmt=3.4.0-r2
