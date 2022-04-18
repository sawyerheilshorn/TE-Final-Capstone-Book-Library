import axios from 'axios';

export default {

    getBookStatus() {
        return axios.get('/getBookStatus');
    },

    sendRequest(isbn, userBorrowFrom) {
        console.log("Hit axios route");
        return axios.post('/sendRequest/' + isbn + "/" + userBorrowFrom);
    },

    updateStatus(request) {
        return axios.post('/updateStatus', request);
    }

}