import os

from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
import uvicorn

from app.database import engine
from app.models.games import Base
from app.api import games


Base.metadata.create_all(bind=engine)

app = FastAPI(title="Games API", version="1.0.0")

origins = ["*"]#os.getenv("CORS_ORIGINS", "").split(",")


app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],  # разрешаем все домены
    allow_credentials=True,
    allow_methods=["*"],  # разрешаем все методы
    allow_headers=["*"],  # разрешаем все заголовки
)

app.include_router(games.router, prefix="/api/v1/games",)

if __name__ == "__main__":
    uvicorn.run(app, host="127.0.0.1", port=8000, reload=True,redirect=False)






