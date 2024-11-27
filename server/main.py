from fastapi import FastAPI
from pydantic import BaseModel
from sqlalchemy import LargeBinary,VARCHAR,TEXT,Column, create_engine
from sqlalchemy.orm import sessionmaker
from sqlalchemy.ext.declarative import declarative_base
app=FastAPI()
DATABASE_URL='postgresql://postgres:1234@localhost:5432/musifly'
engine=create_engine(DATABASE_URL)
SessionLocal = sessionmaker(autocommit = False, autoflush = False,bind=engine)
db = SessionLocal()
Base = declarative_base()
class User(Base):
    __tablename__='users'
    id = Column(TEXT,primary_key=True)
    name = Column(VARCHAR(25))
    email = Column(VARCHAR(100))
    password = Column(LargeBinary)

class UserCreate(BaseModel):
    name:str
    email:str
    password:str
@app.post('/signup')
def signup_user(user:UserCreate):
    print(user.name)
    print(user.email)
    print(user.password)  
    pass
Base.metadata.create_all(engine)