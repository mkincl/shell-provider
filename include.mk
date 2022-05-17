NAME := shell
VERSION := v1

# Container target
IMAGE_REGISTRY := ghcr.io/carlsmedstad
IMAGE_SHELL := $(IMAGE_REGISTRY)/mkincl-$(NAME):$(VERSION)

.PHONY: enter-container-$(NAME)
enter-container-$(NAME):
	docker run --rm --interactive --tty --pull always --volume "$$(pwd)":/pwd --workdir /pwd $(IMAGE_SHELL)

# Generic targets
.PHONY: lint lint-$(NAME)
lint: lint-$(NAME)

.PHONY: fix fix-$(NAME)
fix: fix-$(NAME)

# Actual targets
.PHONY: lint-$(NAME)-shfmt lint-$(NAME)-shellcheck
lint-$(NAME): lint-$(NAME)-shfmt lint-$(NAME)-shellcheck

lint-$(NAME)-shfmt:
	shfmt -d . > /dev/null || shfmt -l .

lint-$(NAME)-shellcheck:
	shfmt -f . | xargs --no-run-if-empty shellcheck

.PHONY: fix-$(NAME)-shfmt
fix-$(NAME): fix-$(NAME)-shfmt

fix-$(NAME)-shfmt:
	shfmt -w .
