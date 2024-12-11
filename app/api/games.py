from fastapi import APIRouter, HTTPException, Depends
from sqlalchemy.orm import Session
from typing import List
from app.schemas import games as schemas
import app.crud.games as crud 
from app.database import get_db
from app.services.games_service import create_game_service, update_game_service, delete_game_service

router = APIRouter(
    tags=["games"],
    responses={404: {"description": "Not found"}},
)


@router.post("/", response_model=schemas.GameRead, status_code=201)
def create_game(game: schemas.GameCreate, db: Session = Depends(get_db)):
    return create_game_service(db, game)

@router.get("/", response_model=List[schemas.GameRead])
def read_games(skip: int = 0, limit: int | None = None, db: Session = Depends(get_db)):
    if limit:
        games = crud.get_games(db, skip=skip, limit=limit)
    else:
        games = crud.get_all_games(db)

    for game in games:
        game.footage_images = game.footage_images
        game.genres = game.genres
        game.os = game.os
    return games



@router.get("/{game_id}", response_model=schemas.GameRead)
def read_game(game_id: int, db: Session = Depends(get_db)):
    db_game = crud.get_game(db, game_id=game_id)
    if db_game is None:
        raise HTTPException(status_code=404, detail="Игра не найдена")
    db_game.footage_images = db_game.footage_images
    db_game.genres = db_game.genres
    db_game.os = db_game.os
    return db_game

@router.put("/{game_id}", response_model=schemas.GameRead)
def update_game(game_id: int, game: schemas.GameCreate, db: Session = Depends(get_db)):
    return update_game_service(db, game_id, game)

@router.delete("/{game_id}", response_model=schemas.GameRead)
def delete_game(game_id: int, db: Session = Depends(get_db)):
    return delete_game_service(db, game_id)
