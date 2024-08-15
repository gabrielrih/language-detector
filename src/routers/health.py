from fastapi import APIRouter


router = APIRouter(
    prefix='/health',
    tags=["health"],
    dependencies=None
)


@router.get("/")
async def health():
    return {}
