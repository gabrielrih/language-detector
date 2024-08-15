import os


AI_MODEL_PATH = os.getenv('AI_MODEL_PATH', 'model.pkl')
AI_VECTORIZER_PATH = os.getenv('AI_VECTORIZER_PATH', 'vectorizer.pkl')

SERVICE_INTERNAL_PORT = os.getenv('SERVICE_INTERNAL_PORT', 8000)

LOG_LEVEL = os.getenv('LOG_LEVEL', 'INFO')
