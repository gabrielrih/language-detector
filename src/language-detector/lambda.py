# Reference: https://medium.com/@g.bharthvajan/create-simple-get-post-rest-api-with-aws-lambda-function-url-7fa962197fa8
import pickle
import logging

from typing import Any
from http import HTTPStatus


logger = logging.getLogger()
logger.setLevel(logging.INFO)


class PickleFile:
    @staticmethod
    def load_from_disk(path: str):
        with open(path, 'rb') as f:
            return pickle.load(f)
        
    @staticmethod
    def save_on_disk(content: Any, path: str):
        with open(path, 'wb') as f:
            pickle.dump(content, f)


class LanguageDetector:
    def __init__(self):
        self.model = PickleFile.load_from_disk(
            path = 'model.pkl'
        )
        self.vectorizer = PickleFile.load_from_disk(
            path = 'vectorizer.pkl'
        )

    def detect(self, message: str) -> str:
        data = self.vectorizer.transform([message]).toarray()
        return self.model.predict(data)


def handler(event, _):
    logger.info(f'Event: {event}')

    custom_sentences = [
        'I am a robot',
        'Mi nombre es Carlos',
        "Olá! Gostaria de lhe conhecer"
    ]

    languages = list()
    for sentence in custom_sentences:
        detector = LanguageDetector()
        language = detector.detect(sentence)[0]
        languages.append(language)

    response = {
        'status_code': HTTPStatus.OK,
        'languages': languages
    }
    logger.info(f'Response: {str(response)}')

    return response

# def handler(event, _):
#     logger.info(f'Event: {event}')
#     http_method = event['requestContext']['http']['method']
#     if http_method != 'POST':
#         logger.exception(error_message)
#         raise Exception(error_message)
    
#     body = event.get('body')
#     if not body:
#         error_message = 'The body should not be empty'
#         logger.error(error_message)
#         return {
#             'status_code': HTTPStatus.BAD_REQUEST,
#             'error_message': error_message
#         }
#     logger.info(f'Received content: {body}')
#     detector = LanguageDetector()
#     language = detector.detect(body)[0]
#     response = {
#         'status_code': HTTPStatus.OK,
#         'language': language
#     }
#     logger.info(f'Response: {str(response)}')
#     return response
