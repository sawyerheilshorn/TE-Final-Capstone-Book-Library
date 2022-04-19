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
    <div class="add-book">
    <button id="add-book-btn" @click="formVisible = !formVisible">
      <i class="bi bi-plus-circle"> Add Book to Library</i></button>

    <create-book v-if="formVisible" />
    </div>
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
   background-color: rgb(203,192,183);
  /* background-color: #caa472; */
  margin-right: 3%;

  width: 75%;
}

.card img {
  height: 70%;
  width: 70%;
  margin: 2% 25% 3% 15%;
  /* margin-left: 23%;
  margin-bottom: 3%; */
}
.card h5 {
  text-align: center;
}
#add-book-btn{
  height: 4%;
  width: 100%;
  margin-bottom: 5%;
 
}



#main-div {
  display: flex;
  margin: 3%;
  
  
}
.add-book{
  display: flex;
  flex-direction: column;
}
</style>