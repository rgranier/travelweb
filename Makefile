## The Makefile includes instructions on environment setup and lint tests
# Create and activate a virtual environment
# Install dependencies in requirements.txt
# Dockerfile should pass hadolint
# app.py should pass pylint
# (Optional) Build a simple integration test

deletepod:



setimage:
	sh "kubectl set image deployments/capstone-test capstone-test=rgranier/capstone-test:latest"

setup:
	# Create python virtualenv & source it
	# source ~/.devops/bin/activate.  We want to put this in the home
	# diretory to keep it from being part of Git.  Two versions, one for
	# Win and one for Linux.
	python3 -m venv ~/.devops

install:
	# This should be run from inside a virtualenv
	pip install --upgrade pip &&\
		pip install -r requirements.txt

test:
	# Additional, optional, tests could go here
	#python -m pytest -vv --cov=myrepolib tests/*.py
	#python -m pytest --nbval notebook.ipynb

lint:
	# See local hadolint install instructions:   https://github.com/hadolint/hadolint
	# This is linter for Dockerfiles
	hadolint Dockerfile
	# This is a linter for Python source code linter: https://www.pylint.org/
	# This should be run from inside a virtualenv
	pip install pylint
	pylint --disable=R,C,W1203 app.py

all: install lint test
