import uuid
from fastapi import APIRouter,File,Form,UploadFile,Depends
from sqlalchemy.orm import Session
from database import get_db
from middleware.auth_middleware import auth_middleware
import cloudinary
import cloudinary.uploader

router =APIRouter()

cloudinary.config( 
    cloud_name = "dftaiwgeo", 
    api_key = "114259842884686", 
    api_secret = "NnLWlKR5AuhZt9Ruuj96XQG6MxU", 
    secure=True
) 
 
@router.post('/upload', status_code =201)

def upload_song(
    song: UploadFile=File(...),
    thumbnail:UploadFile = File(...), 
    artist:str = Form(...),
    song_name: str = Form(...),
    hex_code: str = Form(...),
    db:Session = Depends(get_db),
    auth_dict = Depends(auth_middleware)):
    
    song_id = str(uuid.uuid4())
    song_res = cloudinary.uploader.upload(
        song.file, 
        resource_type='auto',
        folder =f'songs/{song_id}')
    
    print(song_res)
    
    thumbnail_res = cloudinary.uploader.upload(
        thumbnail.file, 
        resource_type='image',
        folder =f'songs/{song_id}')
    
    print(thumbnail_res)
    return 'ok'