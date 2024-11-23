from fastapi import FastAPI,Request
from pydantic import BaseModel

app=FastAPI()
class Test(BaseModel):
    name:str
    age:int
@app.post('/')
def test(t:Test):
    print(t)  
    return "hello"
   