FROM alpine:3.17

RUN apk add --no-cache \
    git=2.38.4-r1 \
    make=4.3-r1

# hadolint ignore=DL3059
RUN apk add --no-cache \
    shellcheck=0.8.0-r1 \
    shfmt=3.5.1-r7
