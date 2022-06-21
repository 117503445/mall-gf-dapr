
import axios from 'axios';


axios.post("http://127.0.0.1:8000/api/user/register", {
    'name': 'ht',
    'password': 123456,
    'gender': 1,
    'mobile': '15212230311',
}).then(function (response) {
    // handle success
    console.log(response.data);
})
