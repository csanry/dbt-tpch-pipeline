


# install poetry
setup-env:
	pip install --upgrade pip \
    && pip install poetry==1.7.1 \
	&& poetry install --no-interaction
