<template>
  <div>
    <div v-for="book in books" v-bind:key="book.isbn">
      <h1>{{ book.title }}</h1>
      <img
        v-if="book.isbn"
        v-bind:src="
          'http://covers.openlibrary.org/b/isbn/' + book.isbn + '-M.jpg'
        "
      />
      <h3>{{ book.author }}</h3>
    </div>
  </div>
</template>

<script>
import BookService from "../services/BookService";
export default {
  components: {},
  name: "Search",
  data() {
    return {
      books: [],
    };
  },
  created() {
    BookService.listBooks().then()((response) => {
      this.books = response.data;
    });
  },
};
</script>

<style>
</style>