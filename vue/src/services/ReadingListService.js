import axios from 'axios';

const http = axios.create({
    baseURL: "http://localhost:8080"
});

export default{
    createList(list){
        return http.post('/createList', list);
    },
    retrieveList(){
        return http.get('/retrieveList');
    }
}