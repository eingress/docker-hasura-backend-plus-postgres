
include .env
export

SHELL := /bin/bash

.PHONY: build release

build:
	docker buildx build \
		--build-arg POSTGIS_VERSION=$$POSTGIS_VERSION \
		--build-arg POSTGRES_VERSION=$$POSTGRES_VERSION \
		--load \
		-t $$IMAGE_NAME:$$IMAGE_VERSION \
		-t $$IMAGE_NAME:latest \
		.

release:
	docker buildx build \
		--build-arg POSTGIS_VERSION=$$POSTGIS_VERSION \
		--build-arg POSTGRES_VERSION=$$POSTGRES_VERSION \
		--platform linux/amd64,linux/arm64 \
		--push \
		-t $$IMAGE_NAME:$$IMAGE_VERSION \
		-t $$IMAGE_NAME:latest \
		.
