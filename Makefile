# Please follow the Makefile style guide.
# http://clarkgrubb.com/makefile-style-guide

SHELL := /bin/sh
BIN := venv/bin
FLAKE8 := $(BIN)/flake8
ISORT := $(BIN)/isort
PIP := $(BIN)/pip
PYTEST := $(BIN)/pytest

.PHONY: venv
venv:
	@virtualenv -p python3.7 venv
	@$(PIP) install isort flake8 pytest pytest-cov

.PHONY: test
test:
	@$(PYTEST) --cov-report term-missing --cov pure_protobuf
	@$(FLAKE8) pure_protobuf tests
	@$(ISORT) -rc -c pure_protobuf tests
	@# TODO: mypy
