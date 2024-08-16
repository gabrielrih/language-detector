import pickle

from typing import Any

from src.util.logger import Logger


logger = Logger.get(__name__)


class PickleFile:
    @staticmethod
    def load_from_disk(path: str):
        with open(path, 'rb') as f:
            return pickle.load(f)
        
    @staticmethod
    def save_on_disk(content: Any, path: str):
        with open(path, 'wb') as f:
            pickle.dump(content, f)
