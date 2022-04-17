import axios from 'axios';

export default {

    getBookStatus() {
        return axios.get('/getBookStatus');
    }

}