#!/bin/bash

set -e
set -x

NO_COVERAGE_TOXENVS=(pep8 py3pep8)
if ! [[ "${NO_COVERAGE_TOXENVS[*]}" =~ "${TOX_ENV}" ]]; then
    source ~/.venv/bin/activate
    bash <(curl -s https://codecov.io/bash) -e TOXENV
fi
