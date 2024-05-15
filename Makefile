#################################################################################
# GLOBALS                                                                       #
#################################################################################


PROJECT_DIR := $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))
PYTHON_INTERPRETER := $(shell which python3)

ifeq (, $(shell which conda))
	HAS_CONDA=False
else
	HAS_CONDA=TRUE
endif


#################################################################################
# COMMANDS             	                                                        #
#################################################################################


.ONESHELL:
.PHONY: setup-env

SHELL = /bin/zsh

setup-env:
	pip install --upgrade pip \
	&& pip install poetry==1.7.1 --quiet \
	&& poetry install --no-interaction --no-root -q;
	poetry shell;


dbt-checks:
	dbt clean --no-clean-project-files-only;
	dbt deps;
	dbt debug;


clean:
	find . -type f -name "*.DS_Store" -ls -delete
	find . | grep -E "(__pycache__|\.pyc|\.pyo)" | xargs rm -rf
	find . | grep -E ".mypy_cache" | xargs rm -rf
	find . | grep -E ".pytest_cache" | xargs rm -rf
	find . | grep -E ".ipynb_checkpoints" | xargs rm -rf
	find . | grep -E ".trash" | xargs rm -rf
	rm -f .coverage


.IGNORE: style
style:
	isort .
	black . --safe
	flake8
	python -m isort . --profile black
	mypy . --strict --ignore-missing-imports


test:
	pytest -vvv tests/dags


tidy:
	@echo "Tidy up the project"
	make style
	make test
	make clean
