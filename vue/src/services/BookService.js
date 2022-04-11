import axios from 'axios';

const http = axios.create({
    baseURL: "http://localhost:8080"
});

export default {
    listBooks() {
        return http.get('/books');
    },
    createList(list){
        return http.post('/createList', list);
    }
}