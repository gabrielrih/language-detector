from fastapi import APIRouter, HTTPException
from http import HTTPStatus

from src.detector import LanguageDetector
from src.util.logger import Logger


logger = Logger.get(__name__)


router = APIRouter(
    prefix="/translate",
    tags=["translate"],
    dependencies=None
)

# We must call it outside the method to be called when the service is started
detector = LanguageDetector()


@router.get("/{message}")
async def translate(message: str):
    try:
        language = detector.detect(message)[0]
        response = {
            'status_code': HTTPStatus.OK,
            'language': language
        }
        logger.info(f'Response: {str(response)}')
        return response
    
    except Exception as exc:
        logger.exception(exc)
        raise HTTPException(status_code = HTTPStatus.INTERNAL_SERVER_ERROR)
