from sqlalchemy import Column, Integer, String, DateTime, ARRAY, func
from app.database import Base
import json

class Game(Base):
    __tablename__ = "games"

    id = Column(Integer, primary_key=True, index=True)
    title = Column(String(100), unique=True, nullable=False, index=True)
    description = Column(String(500), nullable=False)
    main_image_url = Column(String, nullable=False)
    footage_images = Column(ARRAY(String), nullable=False)
    genres = Column(ARRAY(String), nullable=False)
    os = Column(ARRAY(String), nullable=False)
    publisher = Column(String(100), nullable=False)
    developer = Column(String(100), nullable=False)
    release_date = Column(DateTime, nullable=True)
    created_at = Column(DateTime, server_default=func.now())
