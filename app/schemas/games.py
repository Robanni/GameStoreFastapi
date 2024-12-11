from pydantic import BaseModel, Field
from typing import List, Optional
from datetime import datetime


class GameBase(BaseModel):
    title: str = Field(..., max_length=100, description="Название игры")
    description: str = Field(..., max_length=500, description="Описание игры")
    main_image_url: str = Field(..., description="Ссылка на главную картинку")
    footage_images: List[str] = Field(..., description="Ссылки на картинки игры") 
    genres: List[str] = Field(..., description="Жанры игры")  
    os: List[str] = Field(..., description="Операционная система (например, Windows, macOS, Linux)")  
    publisher: str = Field(..., max_length=100, description="Издатель игры")
    developer: str = Field(..., max_length=100, description="Разработчик игры")
    release_date: Optional[datetime] = Field(None, description="Дата релиза игры")

class GameCreate(GameBase):
    pass

class GameRead(GameBase):
    id: int
    created_at: Optional[datetime] = None

    class Config:
        orm_mode = True
