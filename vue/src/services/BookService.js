import axios from 'axios';

export default {
    listBooks() {
        return axios.get('/books');
    },

    getMyBooks() {
        return axios.get('/getMyBooks');
    },

    addBookToLibrary(book) {
        return axios.post('/addBookToLibrary', book)
    }
}