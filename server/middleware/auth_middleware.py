from fastapi import Header,HTTPException
import jwt

def auth_middleware(x_auth_token = Header()):
    try:
        #get the user token
        if not x_auth_token:
            raise HTTPException(401,'No auth token, access Denied!')
       #verified_token = jwt.decode(x_auth_token.encode('utf-8'), 'password_key', algorithms=['HS256'])

        verified_token = jwt.decode(x_auth_token,'password_key',['HS256'])
        if not verified_token:
            raise HTTPException(401,'Token verification failed..!, Authorization failed..')
        uid = verified_token.get('id')
        return {'uid':uid,'token': x_auth_token}
    except jwt.PyJWTError:
        raise HTTPException(401,'token not valid, Authorization failed...')