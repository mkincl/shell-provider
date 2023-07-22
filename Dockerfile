FROM alpine:3.18

RUN apk add --no-cache \
    git=2.40.1-r0 \
    make=4.4.1-r1

# hadolint ignore=DL3059
RUN apk add --no-cache \
    shellcheck=0.9.0-r1 \
    shfmt=3.6.0-r4
