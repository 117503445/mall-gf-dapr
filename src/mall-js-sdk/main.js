
import axios from 'axios';

function assertSuccess(response) {
    if (response['code'] != 0) {
        throw 'code != 0';
    }
}


axios.post("http://127.0.0.1:8000/api/user/register", {
    'mobile': '13766667777',
    'name': 'ht',
    'password': '123456',
    'gender': 1,
}).then(function (response) {
    assertSuccess(response.data)
})

axios.post("http://127.0.0.1:8000/api/user/login", {
    'name': 'ht',
    'password': '123456',
}).then(function (response) {
    assertSuccess(response.data)
})


console.log('success')