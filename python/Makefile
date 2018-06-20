PYTHON=python3
VENV_NAME=.venv

.PHONY: all
all:
	${PYTHON} setup.py build_ext --inplace

.PYTHON: setup-venv
setup-venv:
	${PYTHON} -m venv ${VENV_NAME} && \
	. ${VENV_NAME}/bin/activate && \
	pip install --upgrade pip && \
	pip install -r .requirements.txt

.PHONY: save-venv
save-venv:
	pip freeze > .requirements.txt

.PHONY: clean-venv
clean-venv:
	rm -rf .venv

.PHONY: clean
clean:
	rm -rf build
	rm -rf *.so
