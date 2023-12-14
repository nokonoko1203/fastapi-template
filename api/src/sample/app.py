from fastapi import FastAPI

from .services.opensearch import AsyncOpenSearch

app = FastAPI()


@app.on_event("shutdown")
async def app_shutdown(es: AsyncOpenSearch):
    await es.close()


@app.get("/")
async def hello():
    return {"message": "Hello World"}
