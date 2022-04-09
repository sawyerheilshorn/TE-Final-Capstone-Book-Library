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
      books: [
        // {
        //   isbn: "9781400079278",
        //   title: "Kafka by the Shore",
        //   author: "Haruki Murakami",
        // },
        // {
        //   isbn: "9780356500157",
        //   title: "The Girl With All the Gifts",
        //   author: "M.R. Carey",
        // },
        // {
        //   isbn: "9780684830490",
        //   title: "The Old Man and the Sea",
        //   author: "Ernest Hemingway",
        // },
        // {
        //   isbn: "9781984822178",
        //   title: "Normal People",
        //   author: "Sally Rooney",
        // },
        // {
        //   isbn: "9783125971400",
        //   title: "Le Petit Prince",
        //   author: "Antoine de Saint-ExupÃ©ry",
        // },
      ],
    };
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