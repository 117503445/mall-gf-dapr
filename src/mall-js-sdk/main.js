import axios from 'axios';


let jwt = 'eyJhbGciOiJSUzI1NiIsImtpZCI6ImNlcnQtYnVpbHQtaW4iLCJ0eXAiOiJKV1QifQ.eyJvd25lciI6Im1hbGwiLCJuYW1lIjoidXNlcjEiLCJjcmVhdGVkVGltZSI6IjIwMjItMDYtMjlUMDM6NTI6NDNaIiwidXBkYXRlZFRpbWUiOiIiLCJpZCI6ImZkNDRjOWY1LTBiMTYtNDI3NC1hNmMwLTBiOGIxMjk2N2E2MiIsInR5cGUiOiJub3JtYWwtdXNlciIsInBhc3N3b3JkIjoiIiwicGFzc3dvcmRTYWx0IjoiIiwiZGlzcGxheU5hbWUiOiIiLCJmaXJzdE5hbWUiOiIiLCJsYXN0TmFtZSI6IiIsImF2YXRhciI6Imh0dHBzOi8vY2FzYmluLm9yZy9pbWcvY2FzYmluLnN2ZyIsInBlcm1hbmVudEF2YXRhciI6IiIsImVtYWlsIjoiIiwiZW1haWxWZXJpZmllZCI6ZmFsc2UsInBob25lIjoiIiwibG9jYXRpb24iOiIiLCJhZGRyZXNzIjpbXSwiYWZmaWxpYXRpb24iOiIiLCJ0aXRsZSI6IiIsImlkQ2FyZFR5cGUiOiIiLCJpZENhcmQiOiIiLCJob21lcGFnZSI6IiIsImJpbyI6IiIsInJlZ2lvbiI6IiIsImxhbmd1YWdlIjoiIiwiZ2VuZGVyIjoiIiwiYmlydGhkYXkiOiIiLCJlZHVjYXRpb24iOiIiLCJzY29yZSI6MjAwMCwia2FybWEiOjAsInJhbmtpbmciOjEsImlzRGVmYXVsdEF2YXRhciI6ZmFsc2UsImlzT25saW5lIjpmYWxzZSwiaXNBZG1pbiI6ZmFsc2UsImlzR2xvYmFsQWRtaW4iOmZhbHNlLCJpc0ZvcmJpZGRlbiI6ZmFsc2UsImlzRGVsZXRlZCI6ZmFsc2UsInNpZ251cEFwcGxpY2F0aW9uIjoibWFsbCIsImhhc2giOiIiLCJwcmVIYXNoIjoiIiwiY3JlYXRlZElwIjoiIiwibGFzdFNpZ25pblRpbWUiOiIiLCJsYXN0U2lnbmluSXAiOiIiLCJnaXRodWIiOiIiLCJnb29nbGUiOiIiLCJxcSI6IiIsIndlY2hhdCI6IiIsInVuaW9uSWQiOiIiLCJmYWNlYm9vayI6IiIsImRpbmd0YWxrIjoiIiwid2VpYm8iOiIiLCJnaXRlZSI6IiIsImxpbmtlZGluIjoiIiwid2Vjb20iOiIiLCJsYXJrIjoiIiwiZ2l0bGFiIjoiIiwiYWRmcyI6IiIsImJhaWR1IjoiIiwiYWxpcGF5IjoiIiwiY2FzZG9vciI6IiIsImluZm9mbG93IjoiIiwiYXBwbGUiOiIiLCJhenVyZWFkIjoiIiwic2xhY2siOiIiLCJzdGVhbSI6IiIsImJpbGliaWxpIjoiIiwib2t0YSI6IiIsImRvdXlpbiI6IiIsImN1c3RvbSI6IiIsImxkYXAiOiIiLCJwcm9wZXJ0aWVzIjp7fSwic2NvcGUiOiJyZWFkIiwiaXNzIjoiaHR0cDovL2xvY2FsaG9zdDoxODAwMCIsInN1YiI6ImZkNDRjOWY1LTBiMTYtNDI3NC1hNmMwLTBiOGIxMjk2N2E2MiIsImF1ZCI6WyIzMjU0NjJmYzM1NThkZWFmMzYwYiJdLCJleHAiOjIyNjEzOTYwOTMsIm5iZiI6MTY1NjU5NjA5MywiaWF0IjoxNjU2NTk2MDkzfQ.F1RxxQ9-3jssEzDGFlPFDXBBa2k5iJRTek_pZwJYLMFPGU_-VAnIvFYnkhv04HYEc5d7B8S7voxc_BTPW6S4eHa-_1v5N2vHi2yomwYFx1Uk5SXa1eXxTfNQGmyw38u9CvOnZYfajebrx7YSvejpY_i4hvP9JauHfM7eQrt5VUjtFASMEWna-dJxc-suGVtDMZo1ojQXUR3b4w95fkBLEIf5PZ7uXcrqTVt_HZc2Q1FNUkGWWp6LEDrbfvMLc3a0A_X20FfeVD_pfnT7CPX17eyaUB3GK-s1gAZG085RF4_wnzShUHmqrGliGYJmF-G2xGXtkeKdwsFPoZohBvG_xhZv4JPgnTc1IaGHCxUtZDSDLYuz0h2pk3qOUGQCzsYuMDCOfRmA4wHZ8CeGKe5i_biI2heE7M-TvHa-LPBobTgfs9GintyiKs3QKhQq_Ofl42q3XyqyzTG-AwRlW82gQyoKOEck6x2EF0BNQpCW6luq6cBjDAlCRm-FjmBqGSX1mmk3RXto9N3ZdGqR2QgBpRTMXnT0SlST6o5z2T_5pbZGTdCnG5aOZwrA5qYX78dvO_pW1dJvBMRFirUvZuH8ss9l3Cn9GGZmsIAqf9I0RE8Vd-qHrHzVHRCRoNDwHSeAX_kEk2pbL1L1WnJTsDrbPCkbCcVFaL0HmBpndJdqUNU'

function getHeader() {
    return {
        headers: {
            'Authorization': 'Bearer ' + jwt
        }
    }
}

function assertSuccess(response) {
    assertCode(response, 0)
}

function assertCode(response, code) {
    if (response.data['code'] != code) {
        console.log("response", response.data)
        throw `rsp.code = ${response.data['code']}, code = ${code}`;
    }
}

let cfg = {
    "product": "http://127.0.0.1:8001",
    "order": "http://127.0.0.1:8002",
    "pay": "http://127.0.0.1:8003"
}

let prod = false
if (prod) {
    cfg = {
        "product": "http://product.mall-gf-dapr.local.117503445.top:23333",
        "order": "http://order.mall-gf-dapr.local.117503445.top:23333"
    }
}

async function initDB() {
    // await axios.post("http://127.0.0.1:8000/api/operation/initDB")

    await axios.post(`${cfg["product"]}/api/operation/initDB`)
    await axios.post(`${cfg["order"]}/api/operation/initDB`)
}

await initDB()

// let response = await axios.post("http://127.0.0.1:8000/api/user/register", {
//     'mobile': '13766667777',
//     'name': 'ht',
//     'password': '123456',
//     'gender': 1,
// });
// assertSuccess(response.data)

// response = await axios.post("http://127.0.0.1:8000/api/user/register", {
//     'mobile': '13766667777',
//     'name': 'ht',
//     'password': '123456',
//     'gender': 1,
// });
// if (response.data['code'] != 1) {
//     console.log(response)
//     throw 'code != 1';
// }

// response = await axios.post("http://127.0.0.1:8000/api/user/login", {
//     'name': 'ht',
//     'password': '123456',
// })
// assertSuccess(response.data)


let response = await axios.post(`${cfg["product"]}/api/product`, {
    'name': '苹果',
    'desc': '这个一个又大又圆的苹果，5块钱一个！',
    'stock': 100,
    'price': 5,
});
assertCode(response, 401)

response = await axios.post(`${cfg["product"]}/api/product`, {
    'name': '苹果',
    'desc': '这个一个又大又圆的苹果，5块钱一个！',
    'stock': 100,
    'price': 5,
}, getHeader());
assertSuccess(response)

response = await axios.get(`${cfg["product"]}/api/product/2`);
assertSuccess(response)

response = await axios.get(`${cfg["product"]}/api/product/114514`); // not exists
assertCode(response, 1)

response = await axios.put(`${cfg["product"]}/api/product/2`,
    {
        "name": "香蕉",
        "desc": "这个一个又大又圆的香蕉，5块钱一个！",
        "stock": 100,
        "price": 5
    }, getHeader());
assertSuccess(response)

response = await axios.delete(`${cfg["product"]}/api/product/2`, getHeader());
assertSuccess(response)

response = await axios.delete(`${cfg["product"]}/api/product/2`, getHeader());
assertCode(response, 1)

console.log('product success')

await initDB()

await axios.post(`${cfg["order"]}/api/order`, { "productID": 1, "amount": 5 }, getHeader());

response = await axios.get(`${cfg["order"]}/api/order/2`);
assertSuccess(response)

response = await axios.get(`${cfg["order"]}/api/order/me`, getHeader());
assertSuccess(response)

console.log('order success')

response = await axios.post(`${cfg["pay"]}/api/pay`, {
    'orderID': 1
}, getHeader());
assertSuccess(response)


response = await axios.get(`${cfg["pay"]}/api/pay/1`, getHeader());
assertSuccess(response)

response = await axios.post(`${cfg["pay"]}/api/pay/callback`, {
    "id": 1,
    "source": "alipay",
    "sign": "signed-by-alipay",
    "amount": 20
}, getHeader());
assertSuccess(response)


console.log('pay success')
