import json

from typing import Any


def str_from_file(path: str) -> str:
    with open(path, encoding="utf-8") as file:
        return file.read()


def dump_str(path: str, contents: str) -> None:
    with open(path, mode="w", encoding="utf-8") as file:
        file.write(contents)


def json_from_file(path: str) -> dict[str, Any]:
    with open(path, encoding="utf-8") as file:
        return json.load(file)


def dump_json(path: str, contents: dict[str, Any]) -> None:
    with open(path, mode="w", encoding="utf-8") as file:
        json.dump(contents, file)
