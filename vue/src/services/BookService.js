import axios from 'axios';

export default {
    listBooks() {
        return axios.get('/books');
    }
}