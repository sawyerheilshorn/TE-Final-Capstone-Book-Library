<template>
  <div>
    <div class="jumbotron">
      <div v-for="book in myBooks" v-bind:key="book.isbn">
        <img
          v-bind:src="
            'http://covers.openlibrary.org/b/isbn/' + book.isbn + '-M.jpg'
          "
        />
        <h3>{{ book.title }}</h3>
      </div>
    </div>
    <button>Add Book to My Library</button>
  </div>
</template>

<script>
import BookService from "../services/BookService";
export default {
  name: "my-library",
  data() {
    return {
      myBooks: [],
    };
  },

  created() {
    BookService.getMyBooks().then((response) => {
      this.myBooks = response.data;
    });
  },
};
</script>

<style scoped>
#add-book {
  color: red;
}
</style>