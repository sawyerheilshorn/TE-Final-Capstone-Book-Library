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
    },

    addBookToList(book, listId) {
        console.log("the book isbn :" + book.isbn);
        return axios.put('/addBookToList/' + listId + "/" + book.isbn);
    }
}