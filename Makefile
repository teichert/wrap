.PHONY: check
check:
	make lint type test

.PHONY: check-all
check-all:
	make lint type test --keep-going

.PHONY: install
install: pyproject.lock

.PHONY: install-python
install-python:
	wget -qO- https://micro.mamba.pm/api/micromamba/linux-64/latest | tar -xvj bin/micromamba
	~/bin/micromamba shell init -s bash -p ~/micromamba
	echo "micromamba activate"
	source ~/.bashrc
	micromamba install python=3.9

.PHONY: install-poetry
install-poetry:
	python -m pip install --user -U pipx
	python -m pipx ensurepath
	python -m pipx install poetry

pyproject.lock: pyproject.toml
	poetry update
	poetry install --remove-untracked
	touch pyproject.lock

.PHONY: test
test: pyproject.lock
	@echo "running tests..."
	poetry run python -m pytest --cov=src --cov-branch --cov-report term-missing:skip-covered --cov-report html --codeblocks

# more verbose testsing; stops after the first failure; use t="test_name" to only run matching tests
# e.g.
# make test1 t="test_example_function"
t := "."
.PHONY: test1
test1: pyproject.lock
	@echo "running test..."
	poetry run python -m pytest -x -s -vvv -k $t

.PHONY: lint
lint: pyproject.lock
	@echo "running linter..."
	poetry run python -m flake8

.PHONY: type
type: pyproject.lock
	@echo "running type checker..."
	poetry run python -m mypy . --check-untyped-defs

.PHONY: doc
doc: pyproject.lock
	poetry run python -m pdoc -o ./docs src

eargs := 
edeps := 
e := examples/demo.py $(eargs)
.PHONY: example
example: $(edeps) pyproject.lock
	poetry run python $e

.PHONY: dexample
dexample: $(edeps) pyproject.lock
	poetry run python -m pdb $e

# CHANGEME: change project to the name of your package
project := python_project
profile_args := --profile-all --profile-interval 30 --profile-only $(project)/src/$(project)
profile: $(edeps) pyproject.lock
	poetry run python -m scalene  --reduced-profile --outfile scalene.report $e
