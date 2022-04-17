import axios from 'axios';

export default {
    createList(list) {
        return axios.post('/createList', list);
    },
    retrieveList() {
        return axios.get('/dashboard');
    },
    removeBookFromList(id, isbn) {
        return axios.put('/removeBookFromList/' + id + '/' + isbn);
    },

    removeList(id) {
        return axios.put('/removeList/' + id);
    },
    getBookStatus(){
        return axios.get('/getbookstatus');
    }

}