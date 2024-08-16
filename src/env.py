import os


AI_MODEL_PATH = os.getenv('AI_MODEL_PATH', '/app/model.pkl')
AI_VECTORIZER_PATH = os.getenv('AI_VECTORIZER_PATH', '/app/vectorizer.pkl')

SERVICE_INTERNAL_PORT = os.getenv('SERVICE_INTERNAL_PORT', 8000)

LOG_LEVEL = os.getenv('LOG_LEVEL', 'INFO')
