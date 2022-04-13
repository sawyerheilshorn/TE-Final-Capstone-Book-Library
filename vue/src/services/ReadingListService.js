import axios from 'axios';

export default {
    createList(list) {
        return axios.post('/createList', list);
    },
    retrieveList() {
        return axios.get('/dashboard');
    }
}