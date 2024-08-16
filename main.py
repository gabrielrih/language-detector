import uvicorn

from fastapi import FastAPI

import src.env as envs

from src.routers import (
    health, 
    translate
)

app = FastAPI()

app.include_router(health.router, prefix = '/api')
app.include_router(translate.router, prefix = '/api')


if __name__ == '__main__':
    uvicorn.run(app, host = "0.0.0.0", port = envs.SERVICE_INTERNAL_PORT)
