# api

## user

### register

用户注册

```http
POST http://localhost:8000/api/user/register

{
    "name": "ht",
    "password": "1",
    "gender": 1,
    "mobile": "15212230311"
}
```

```json
{
    "code": 0,
    "message": "success",
    "data": {
        "ID": 1
    }
}

{
    "code": 1,
    "message": "用户已注册",
    "data": null
}
```

### login

```http
POST http://localhost:8000/api/user/register

{
    "name": "ht",
    "password": "1",
    "gender": 1,
    "mobile": "15212230311"
}
```

```json
{
    "code": 0,
    "message": "success",
    "data": {
        "token": "{""}"
    }
}

{
    "code": 1,
    "message": "用户名或密码错误",
    "data": null
}
```

### info

```http
GET http://localhost:8000/api/user/info

Authorization: Bearer {"userID": 1}
```

```json
{
    "code": 0,
    "message": "success",
    "data": {
        "name": "ht",
        "gender": 1,
        "mobile": "15212230311"
    }
}
```
