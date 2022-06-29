import axios from 'axios';


let jwt = 'eyJhbGciOiJSUzI1NiIsImtpZCI6ImNlcnQtYnVpbHQtaW4iLCJ0eXAiOiJKV1QifQ.eyJvd25lciI6Im1hbGwiLCJuYW1lIjoidXNlcjEiLCJjcmVhdGVkVGltZSI6IjIwMjItMDYtMjlUMDM6NTI6NDNaIiwidXBkYXRlZFRpbWUiOiIiLCJpZCI6ImZkNDRjOWY1LTBiMTYtNDI3NC1hNmMwLTBiOGIxMjk2N2E2MiIsInR5cGUiOiJub3JtYWwtdXNlciIsInBhc3N3b3JkIjoiIiwicGFzc3dvcmRTYWx0IjoiIiwiZGlzcGxheU5hbWUiOiIiLCJmaXJzdE5hbWUiOiIiLCJsYXN0TmFtZSI6IiIsImF2YXRhciI6Imh0dHBzOi8vY2FzYmluLm9yZy9pbWcvY2FzYmluLnN2ZyIsInBlcm1hbmVudEF2YXRhciI6IiIsImVtYWlsIjoiIiwiZW1haWxWZXJpZmllZCI6ZmFsc2UsInBob25lIjoiIiwibG9jYXRpb24iOiIiLCJhZGRyZXNzIjpbXSwiYWZmaWxpYXRpb24iOiIiLCJ0aXRsZSI6IiIsImlkQ2FyZFR5cGUiOiIiLCJpZENhcmQiOiIiLCJob21lcGFnZSI6IiIsImJpbyI6IiIsInJlZ2lvbiI6IiIsImxhbmd1YWdlIjoiIiwiZ2VuZGVyIjoiIiwiYmlydGhkYXkiOiIiLCJlZHVjYXRpb24iOiIiLCJzY29yZSI6MjAwMCwia2FybWEiOjAsInJhbmtpbmciOjEsImlzRGVmYXVsdEF2YXRhciI6ZmFsc2UsImlzT25saW5lIjpmYWxzZSwiaXNBZG1pbiI6ZmFsc2UsImlzR2xvYmFsQWRtaW4iOmZhbHNlLCJpc0ZvcmJpZGRlbiI6ZmFsc2UsImlzRGVsZXRlZCI6ZmFsc2UsInNpZ251cEFwcGxpY2F0aW9uIjoibWFsbCIsImhhc2giOiIiLCJwcmVIYXNoIjoiIiwiY3JlYXRlZElwIjoiIiwibGFzdFNpZ25pblRpbWUiOiIiLCJsYXN0U2lnbmluSXAiOiIiLCJnaXRodWIiOiIiLCJnb29nbGUiOiIiLCJxcSI6IiIsIndlY2hhdCI6IiIsInVuaW9uSWQiOiIiLCJmYWNlYm9vayI6IiIsImRpbmd0YWxrIjoiIiwid2VpYm8iOiIiLCJnaXRlZSI6IiIsImxpbmtlZGluIjoiIiwid2Vjb20iOiIiLCJsYXJrIjoiIiwiZ2l0bGFiIjoiIiwiYWRmcyI6IiIsImJhaWR1IjoiIiwiYWxpcGF5IjoiIiwiY2FzZG9vciI6IiIsImluZm9mbG93IjoiIiwiYXBwbGUiOiIiLCJhenVyZWFkIjoiIiwic2xhY2siOiIiLCJzdGVhbSI6IiIsImJpbGliaWxpIjoiIiwib2t0YSI6IiIsImRvdXlpbiI6IiIsImN1c3RvbSI6IiIsImxkYXAiOiIiLCJwcm9wZXJ0aWVzIjp7fSwic2NvcGUiOiJyZWFkIiwiaXNzIjoiaHR0cDovL2xvY2FsaG9zdDoxODAwMCIsInN1YiI6ImZkNDRjOWY1LTBiMTYtNDI3NC1hNmMwLTBiOGIxMjk2N2E2MiIsImF1ZCI6WyIzMjU0NjJmYzM1NThkZWFmMzYwYiJdLCJleHAiOjE2NTcwNzk2MjMsIm5iZiI6MTY1NjQ3NDgyMywiaWF0IjoxNjU2NDc0ODIzfQ.mzivvJyjhnHKnn83XeK5HuEbYr6J_EgfvaqpLP8ZwuQB_PDjBg9bZDECBdyxKUiPamNNQEyVYs14muFqpuS2Z7m_JzUbPgnv8EWV98He8VDxddTajGVC0wdHlR1OQJ8qQDh3e9s9s2giBOuLKClnTe4YuDwjs0kQkmDmplXHbMCVX_ZLjv-z4RO1sSNeLW8kHMSh7qiN24HMSN2SCKVg4jd0c-Kc1I1ggMBs05IKW2HE_65V5iiDHaFzvo_tt-x8SBu9glaWjjEP7bwlFGtSmWUGntp4LAA4k6_YONrRS1r3B87Q3Fx6pM2yJgnUiWy2iVmpKdKWKtXkw10szn1Bcl6C7QM5OqPZ3RiCkZ6jM6mkeinUZJh2SvVI50qhKEjsyyn9Uyxugvg9WrkLnQN3kWovpb0hZoKeEjwBJastsm9GAwJHgowrzQ-M7x_VW8vJ5W9hvw9_lqAWbW8miAjHG1dy47HFZ3-M76qAOH_GrWLdDvGC6cLb--LbGHCpdQsiOXO-hUAukXfenaINt9POsNEVTKLTQEpp0m8invUYzgH_Y3jA6XP9clD0q0br29lZrrrE6j_tz04H716MHyERyViG7bpz_zBDxUB0NFYl0Gtmrvc1IE5WfEzoSKWJ6ctJKdz2ACg4UpNdT94GpqWhAxRzVeqDv5H3UbBDZuH3oRY'

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
        console.log(response)
        throw `rsp.code = ${response.data['code']}, code = ${code}`;
    }
}

async function initDB() {
    // await axios.post("http://127.0.0.1:8000/api/operation/initDB")
    await axios.post("http://127.0.0.1:8001/api/operation/initDB")
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


let response = await axios.post("http://127.0.0.1:8001/api/product", {
    'name': '苹果',
    'desc': '这个一个又大又圆的苹果，5块钱一个！',
    'stock': 100,
    'price': 5,
});
assertCode(response, 401)

response = await axios.post("http://127.0.0.1:8001/api/product", {
    'name': '苹果',
    'desc': '这个一个又大又圆的苹果，5块钱一个！',
    'stock': 100,
    'price': 5,
}, getHeader());
assertSuccess(response)

response = await axios.get("http://127.0.0.1:8001/api/product/1");
assertSuccess(response)

response = await axios.get("http://127.0.0.1:8001/api/product/2");
assertCode(response, 1)


response = await axios.put("http://127.0.0.1:8001/api/product/1",
    {
        "name": "香蕉",
        "desc": "这个一个又大又圆的香蕉，5块钱一个！",
        "stock": 100,
        "price": 5
    }, getHeader());
assertSuccess(response)

response = await axios.delete("http://127.0.0.1:8001/api/product/1", getHeader());
assertSuccess(response)

response = await axios.delete("http://127.0.0.1:8001/api/product/1", getHeader());
assertSuccess(response)

console.log('success')
