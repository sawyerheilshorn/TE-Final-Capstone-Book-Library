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
      <label for="author">Author</label>
      <input
        id="author"
        type="text"
        v-model="book.author"
        placeholder="author"
        required
      />
      <label for="genre">Genre</label>
      <input
        id="genre"
        type="text"
        v-model="book.genreList[0].genre_name"
        placeholder="genre"
        required
      />
      <button
        type="submit"
        @click="createBook()"
        class="btn btn-submit"
        id="btn-submit"
      >
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
        genreList: [
          {
            genre_name: "",
          },
        ],
      },
    };
  },

  methods: {
    createBook() {       
      BookService.addBookToLibrary(this.book).then((response) => {
        if (response.status === 200) {
          console.log(response);
        }
        this.$router.go(this.$router.currentRoute);
      });
    },
  },
};
</script>

<style scoped>
#btn-submit {
  color: white;
  margin-left: 2%;
}
</style>