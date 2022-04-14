import axios from 'axios';

export default {
    listBooks() {
        return axios.get('/books');
    },

    getMyBooks() {
        return axios.get('/getMyBooks');
    },

    addBookToLibrary(book) {
        axios.post('/addBookToLibrary', book)
    }
}