from sqlalchemy.orm import Session
from app.crud.games import get_game_by_title, create_game, update_game, delete_game
from app.schemas.games import GameCreate
from fastapi import HTTPException

def create_game_service(db: Session, game: GameCreate):
    existing_game = get_game_by_title(db, title=game.title)
    if existing_game:
        raise HTTPException(status_code=400, detail="Игра с таким названием уже существует")
    created_game = create_game(db, game)
    if not created_game:
        raise HTTPException(status_code=400, detail="Ошибка при создании игры")
    return created_game

def update_game_service(db: Session, game_id: int, game: GameCreate):
    db_game = update_game(db, game_id, game)
    if not db_game:
        raise HTTPException(status_code=400, detail="Ошибка при обновлении игры или игра не найдена")
    return db_game

def delete_game_service(db: Session, game_id: int):
    db_game = delete_game(db, game_id)
    if not db_game:
        raise HTTPException(status_code=404, detail="Игра не найдена")
    return db_game
