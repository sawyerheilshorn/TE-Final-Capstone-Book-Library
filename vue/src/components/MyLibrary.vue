<template>
  <div id="main-div">
    <div class="jumbotron row">
      <div class="row" v-for="book in myBooks" v-bind:key="book.isbn">
        <div class="card" id="myLibraryCard">
          <img
            v-bind:src="
              'http://covers.openlibrary.org/b/isbn/' + book.isbn + '-M.jpg'
            "
          />

          <h5>{{ book.title }}</h5>
        </div>
      </div>
    </div>
    <button @click="formVisible = !formVisible">Add Book to Library</button>

    <create-book v-if="formVisible" />
  </div>
</template>

<script>
import BookService from "../services/BookService";
import CreateBook from "../components/CreateBook.vue";
export default {
  name: "my-library",
  components: { CreateBook },
  data() {
    return {
      myBooks: [],
      formVisible: false,
    };
  },

  created() {
    BookService.getMyBooks().then((response) => {
      this.myBooks = response.data;
      this.$store.commit("ADD_ALL_BOOK", this.myBooks);
    });
  },
};
</script>

<style scoped>
.jumbotron {
  display: flex;
  justify-content: space-evenly;
  background-color: #caa472;
  margin-right: 3%;

  width: 75%;
}

.card img {
  height: 70%;
  width: 70%;
  margin-left: 23%;
  margin-bottom: 3%;
}
.card h5 {
  text-align: center;
}
button {
  /* height: 70%; */
}
#myLibraryCard {
  margin-right: 10%;
}

#main-div {
  display: flex;
}
</style>