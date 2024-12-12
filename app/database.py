from sqlalchemy import create_engine
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import sessionmaker
import os
from dotenv import load_dotenv

load_dotenv()


DATABASE_URL = f"postgresql://{os.getenv('POSTGRES_DB_USER')}:{os.getenv('POSTGRES_DB_PASSWORD')}@db:5432/database"
# DATABASE_URL = f"postgresql://nfagames:123@localhost:5432/nfagames"



engine = create_engine(
    DATABASE_URL, connect_args={"check_same_thread": False} if "sqlite" in DATABASE_URL else {}
)

SessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=engine)

Base = declarative_base()

def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()