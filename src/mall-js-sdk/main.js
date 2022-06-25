
import axios from 'axios';

function assertSuccess(response) {
    if (response['code'] != 0) {
        console.log(response)
        throw 'code != 0';
    }
}

let response = await axios.post("http://127.0.0.1:8000/api/user/register", {
    'mobile': '13766667777',
    'name': 'ht',
    'password': '123456',
    'gender': 1,
});
assertSuccess(response.data)

response = await axios.post("http://127.0.0.1:8000/api/user/register", {
    'mobile': '13766667777',
    'name': 'ht',
    'password': '123456',
    'gender': 1,
});
if (response.data['code'] != 1) {
    console.log(response)
    throw 'code != 1';
}

response = await axios.post("http://127.0.0.1:8000/api/user/login", {
    'name': 'ht',
    'password': '123456',
})
assertSuccess(response.data)

console.log('success')