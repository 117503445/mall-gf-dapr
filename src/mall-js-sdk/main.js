
import axios from 'axios';


axios.get("http://www.baidu.com").then(function (response) {
    // handle success
    console.log(response.data);
})
