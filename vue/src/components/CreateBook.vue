<template>
  <div>
    <form v-on:submit.prevent class="homeForm">
      <label for="isbn">ISBN</label>
      <input
        id="isbn"
        type="text"
        v-model="book.isbn"
        placeholder="ISBN"
        required
      />
      <label for="title">Title</label>
      <input
        id="title"
        type="text"
        v-model="book.title"
        placeholder="title"
        required
      />
      <label for="title">Author</label>
      <input
        id="author"
        type="text"
        v-model="book.author"
        placeholder="author"
        required
      />
      <label for="title">Genre</label>
      <input
        id="genre"
        type="text"
        v-model="book.genre"
        placeholder="genre"
        required
      />
      <button type="submit" @click="createBook()" class="btn btn-submit">
        Submit
      </button>
    </form>
  </div>
</template>

<script>
import BookService from "../services/BookService";
export default {
  name: "create-book",
  data() {
    return {
      book: {
        isbn: "",
        title: "",
        author: "",
        genre: "",
      },
    };
  },

  methods: {
    createBook() {
      BookService.addBookToLibrary(this.book).then((response) => {
        if (response.status === 200) {
          console.log(response);
        }
        this.$router.push("dashboard");
      });
    },
  },
};
</script>

<style>
</style>