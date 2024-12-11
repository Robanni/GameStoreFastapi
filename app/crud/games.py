from sqlalchemy.orm import Session
from app.schemas import games as schemas
from app.models.games import Game as ModelGame
from sqlalchemy.exc import IntegrityError

def get_game(db: Session, game_id: int):
    return db.query(ModelGame).filter(ModelGame.id == game_id).first()

def get_game_by_title(db: Session, title: str):
    return db.query(ModelGame).filter(ModelGame.title == title).first()

def get_games(db: Session, skip: int = 0, limit: int = 10):
    return db.query(ModelGame).offset(skip).limit(limit).all()

def get_all_games(db: Session):
    return db.query(ModelGame).all()

def create_game(db: Session, game: schemas.GameCreate):
    db_game = ModelGame(
        title=game.title,
        description=game.description,
        main_image_url=str(game.main_image_url),
        footage_images=game.footage_images,  
        genres=game.genres,  
        os=game.os,  
        publisher=game.publisher,
        developer=game.developer,
        release_date=game.release_date
    )
    db.add(db_game)
    try:
        db.commit()
        db.refresh(db_game)
    except IntegrityError:
        db.rollback()
        return None
    return db_game

def update_game(db: Session, game_id: int, game: schemas.GameCreate):
    db_game = get_game(db, game_id)
    if not db_game:
        return None
    db_game.title = game.title
    db_game.description = game.description
    db_game.main_image_url = str(game.main_image_url)
    db_game.footage_images = game.footage_images,  
    db_game.genres = game.genres, 
    db_game.os=game.os,  
    db_game.publisher = game.publisher
    db_game.developer = game.developer
    db_game.release_date = game.release_date
    try:
        db.commit()
        db.refresh(db_game)
    except IntegrityError:
        db.rollback()
        return None
    return db_game

def delete_game(db: Session, game_id: int):
    db_game = get_game(db, game_id)
    if not db_game:
        return None
    db.delete(db_game)
    db.commit()
    return db_game
