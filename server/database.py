from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker

<<<<<<< HEAD
=======
# Creating an Database for the application
>>>>>>> 3fd348d (MP3 PLAYER)
DATABASE_URL='postgresql://postgres:1234@localhost:5432/musifly'
engine=create_engine(DATABASE_URL)
SessionLocal = sessionmaker(autocommit = False, autoflush = False,bind=engine)
def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()