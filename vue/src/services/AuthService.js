import axios from 'axios';

export default {

    login(user) {
        return axios.post('/login', user)
    },

    register(user) {
        return axios.post('/register', user)
    },

    getUsers(isbn) {
        return axios.get('/getUsers/' + isbn)
    }

}