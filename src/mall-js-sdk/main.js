import axios from 'axios';

function assertSuccess(response) {
    if (response['code'] != 0) {
        console.log(response)
        throw 'code != 0';
    }
}

// async function initDB() {
//     await axios.post("http://127.0.0.1:8000/api/operation/initDB")
// }

// await initDB()

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
assertSuccess(response.data)

console.log('success')
