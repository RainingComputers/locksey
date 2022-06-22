PROJECT_NAME=locksey

.PHONY: help clean test lint quality docs

help:
	@echo "Note: Please make sure you are in pipenv shell"
	@echo ""
	@echo "clean"
	@echo "    Remove generated files"
	@echo "format"
	@echo "    Format files"
	@echo "lint"
	@echo "    Print pylint score"
	@echo "quality"
	@echo "	   Print code quality report"
	@echo "build"
	@echo "    Build wheel and tar"
	@echo ""

clean:
	rm -f -r .pytest_cache/
	find . -type d -name  "__pycache__" -exec rm -r {} +
	rm -f -r .repos/
	rm -f -r build/
	rm -f -r dist/

format:
	black .

lint:
	pylint $(PROJECT_NAME)  --rcfile ./.pylintrc

quality:
	python3 -m radon mi $(PROJECT_NAME)
	python3 -m radon cc $(PROJECT_NAME)

build:
	rm -rf dist/
	rm -rf $(PROJECT_NAME).egg-info
	python -m build

