<template>
  <div class="jumbotron row ">
    
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
.jumbotron {
  display: flex;
  justify-content: space-evenly;
  background-color: #caa472;

  width: 75%;
}
.card{
 
}
.card img{
  height: 70%;
  width: 70%;
  margin-left: 23% ;
  margin-bottom: 3%;
}
.card h5{
  text-align: center;

}
#myLibraryCard{
   margin-right: 10% ;
}


</style>