# Overview
This is a sample python project.

## Prereqs
- Python `>= 3.8` (if you have `make` and checkout the repo, you can use `make install-python`)

## Install
<!--pytest-codeblocks:skip-->
```bash
# CHANGEME: put in your own username and the name of this repo
python -m pip install git+ssh://git@github.com/<username>/<repo>
```

## Development with `poetry`
Prereq: install [poetry](https://python-poetry.org/docs/#installation):

### Option 1
<!--pytest-codeblocks:skip-->
`make install-poetry` will install `poetry` via `pipx`


### Option 2
<!--pytest-codeblocks:skip-->
```bash
curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python -
```

Note that you will need to restart your terminal before poetry will be found on your path.

<!--pytest-codeblocks:skip-->
```bash
make lint  # run flake8 linter
make type  # mypy type checking
make test  # run pytest tests (also tries snippets in Readme.md)
make  # does the above three
make test1 t="test_example_function"  # more verbose testing for "test_example_function"
make example  # run example script
make dexample  # run example script via pdb
make profile  # run example script via scalene profiler: output is refreshed in scalene.report every 30 seconds
make doc  # creates html documentation
```

## Style
Unless otherwise specified, let's follow [this guide](https://luminousmen.com/post/the-ultimate-python-style-guidelines).

