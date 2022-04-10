<template>
  <div>
    <div>
      <label for="isbnFilter">Filter by ISBN</label>
      <input type="text" v-model="filter.isbn" id="isbnFilter" />
      <label for="titleFilter">Filter by Title</label>
      <input type="text" v-model="filter.title" id="titleFilter" />
      <label for="authorFilter">Filter by Author</label>
      <input type="text" v-model="filter.author" id="authorFilter" />
    </div>
    <div class="book-container">
      <book-card
        v-bind:book="book"
        v-for="book in filteredBooks"
        v-bind:key="book.isbn"
      />
    </div>
  </div>
</template>

<script>
import BookService from "../services/BookService";
import BookCard from "../components/BookCard.vue";
export default {
  components: {
    BookCard,
  },
  name: "book-list",
  data() {
    return {
      books: [],
      filter: {
        isbn: "",
        title: "",
        author: "",
      },
    };
  },
  computed: {
    filteredBooks: function () {
      return this.books
        .filter((book) => book.isbn.includes(this.filter.isbn))
        .filter((book) =>
          book.title.toLowerCase().includes(this.filter.title.toLowerCase())
        )
        .filter((book) =>
          book.author.toLowerCase().includes(this.filter.author.toLowerCase())
        );
    },
  },

  created() {
    BookService.listBooks().then((response) => {
      this.books = response.data;
    });
  },
};
</script>

<style>
</style>