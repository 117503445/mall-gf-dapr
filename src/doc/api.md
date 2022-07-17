# api

## 用户

### 用户注册

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
        "id": 1
    }
}

{
    "code": 1,
    "message": "用户已注册",
    "data": null
}
```

### 用户登录

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

### 查询个人信息

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

## 产品 product

### 产品创建

need login

```http
POST http://localhost:8001/api/product

{
    "name": "苹果",
    "desc": "这个一个又大又圆的苹果，5块钱一个！",
    "stock": 100,
    "price": 5
}
```

```json
{
    "code": 0,
    "message": "success",
    "data": {
        "id": 1
    }
}
```

| 字段   	| 意义   	|
|--------	|--------	|
| name   	| 商品名 	|
| desc   	| 描述   	|
| stock  	| 当前库存 	|
| price 	| 当前价格 	|

### 产品详情

```http
GET http://localhost:8001/api/product/1
```

```json
{
    "code": 0,
    "message": "success",
    "data": {
        "id": 1,
        "name": "苹果",
        "desc": "这个一个又大又圆的苹果，5块钱一个！",
        "stock": 100,
        "price": 5
    }
}

{
    "code": 1,
    "message": "产品不存在",
    "data": null
}
```

### 产品更新

需传递所有字段

只有产品创建者有权限修改

```http
PUT http://localhost:8001/api/product/1

Authorization: Bearer {"userID": 1}

{
    "name": "香蕉",
    "desc": "这个一个又大又圆的香蕉，5块钱一个！",
    "stock": 100,
    "price": 5
}
```

```json
{
    "code": 0,
    "message": "success",
    "data": {
        "id": 1,
        "name": "香蕉",
        "desc": "这个一个又大又圆的香蕉，5块钱一个！",
        "stock": 100,
        "price": 5
    }
}

{
    "code": 1,
    "message": "产品不存在",
    "data": null
}

{
    "code": 2,
    "message": "非产品创建者",
    "data": null
}

{
    "code": 3,
    "message": "库存小于已售物品",
    "data": null
}
```

### 产品删除

```http
DELETE http://localhost:8001/api/product/1

Authorization: Bearer {"userID": 1}
```

```json
{
    "code": 0,
    "message": "success",
    "data": null
}

{
    "code": 1,
    "message": "产品不存在",
    "data": null
}

{
    "code": 2,
    "message": "非产品创建者",
    "data": null
}
```

## 订单 order

### 订单创建

```http
POST http://localhost:8002/api/order

Authorization: Bearer {"userID": 1}

{
    "productID": 1,
    "amount": 5
}
```

| 字段   	| 意义   	|
|--------	|--------	|
| productID	| 商品ID 	|
| amount    | 数量   	|

```json
{
    "code": 0,
    "message": "success",
    "data": {
        "id": 1
    }
}

{
    "code": 1,
    "message": "产品不存在",
    "data": null
}

{
    "code": 2,
    "message": "产品库存不足",
    "data": null
}
```

### 订单详情

```http
GET http://localhost:8002/api/order/1

Authorization: Bearer {"userID": 1}
```

```json
{
    "code": 0,
    "message": "success",
    "data": {
        "id": 1,
        "productID": 1,
        "amount": 5
    }
}

{
    "code": 1,
    "message": "订单不存在",
    "data": null
}
```

### 订单删除

```http
DELETE http://localhost:8002/api/order/1

Authorization: Bearer {"userID": 1}
```

```json
{
    "code": 0,
    "message": "success",
    "data": null
}

{
    "code": 1,
    "message": "订单不存在",
    "data": null
}
```

### 个人订单列表

```http
GET http://localhost:8002/api/order/me

Authorization: Bearer {"userID": 1}
```

```json
{
    "code": 0,
    "message": "success",
    "data": [
        {
            "id": 1,
            "productID": 1,
            "amount": 5
        },
        {
            "id": 2,
            "productID": 2,
            "amount": 3
        }
    ]
}
```

## 支付 pay

### 支付创建

```http
POST http://localhost:8003/api/pay

Authorization: Bearer {"userID": 1}

{
    "orderID": 1,
}
```

| 字段   	| 意义   	|
|--------	|--------	|
| orderID	| 订单ID 	|

```json
{
    "code": 0,
    "message": "success",
    "data": {
        "id": 1,
        "status": 0
    }
}

{
    "code": 1,
    "message": "订单不存在",
    "data": null
}

{
    "code": 2,
    "message": "存在进行中的支付订单",
    "data": null
}
```

| 字段   	| 意义   	                            |
|--------	|--------	                            |
| status	| 支付状态, 0-待支付, 1-已取消, 2-成功 	|

### 支付详情

```http
GET http://localhost:8003/api/pay/1

Authorization: Bearer {"userID": 1}
```

```json
{
    "code": 0,
    "message": "success",
    "data": {
        "id": 1,
        "status": 0
    }
}

{
    "code": 1,
    "message": "支付订单不存在",
    "data": null
}
```

### 支付回调

```http
POST http://localhost:8003/api/pay/callback

{
    "id": 1,
    "source": "alipay",
    "sign": "signed-by-alipay",
    "amount": 20
}
```

| 字段   	| 意义   	|
|--------	|--------	|
| amount    | 金额   	|
| source    | 支付提供商|
| sign      | 签名   	|

```json
{
    "code": 0,
    "message": "success",
    "data": null
}

{
    "code": 1,
    "message": "支付提供商验签失败",
    "data": null
}

{
    "code": 2,
    "message": "不支持的支付提供商",
    "data": null
}

{
    "code": 3,
    "message": "订单不存在",
    "data": null
}

{
    "code": 4,
    "message": "金额错误",
    "data": null
}
```

### 支付取消

```http
POST http://localhost:8003/api/pay/cancel/1

Authorization: Bearer {"userID": 1}
```

```json
{
    "code": 0,
    "message": "success",
    "data": null
}

{
    "code": 1,
    "message": "订单不存在",
    "data": null
}

{
    "code": 2,
    "message": "订单状态错误",
    "data": {
        "status": 0
    }
}
```