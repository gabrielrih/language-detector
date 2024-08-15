import src.env as envs

from src.util.file import PickleFile


class LanguageDetector:
    def __init__(self):
        self.model = PickleFile.load_from_disk(
            path = envs.AI_MODEL_PATH
        )
        self.vectorizer = PickleFile.load_from_disk(
            path = envs.AI_VECTORIZER_PATH
        )

    def detect(self, message: str) -> str:
        data = self.vectorizer.transform([message]).toarray()
        return self.model.predict(data)
