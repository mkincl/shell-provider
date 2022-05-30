NAME := shell
VERSION := v1

# Container target
IMAGE_SHELL := ghcr.io/mkincl/$(NAME)-provider:$(VERSION)

.PHONY: enter-container-$(NAME)
enter-container-$(NAME):
	docker run --rm --interactive --tty --pull always --volume "$$(pwd)":/pwd --workdir /pwd $(IMAGE_SHELL)

# Generic targets
.PHONY: lint lint-$(NAME)
lint: lint-$(NAME)

.PHONY: fix fix-$(NAME)
fix: fix-$(NAME)

# Which files to act on. This is overrideable.
FILES_SHELL = $(shell shfmt -f .)

.PHONY: has-files-shell
has-files-shell:
	@for file in $(FILES_SHELL); do exit 0; done; echo "FILES_SHELL is empty"; exit 1

# Specific targets
.PHONY: lint-$(NAME)-shfmt lint-$(NAME)-shellcheck
lint-$(NAME): lint-$(NAME)-shfmt lint-$(NAME)-shellcheck

lint-$(NAME)-shfmt: has-files-shell
	shfmt -d $(FILES_SHELL) > /dev/null || shfmt -l .

lint-$(NAME)-shellcheck: has-files-shell
	shellcheck $(FILES_SHELL)

.PHONY: fix-$(NAME)-shfmt
fix-$(NAME): fix-$(NAME)-shfmt

fix-$(NAME)-shfmt: has-files-shell
	shfmt -w $(FILES_SHELL)
