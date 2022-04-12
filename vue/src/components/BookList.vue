<template>
  <div>
    <div>
      <div class="row g-3" for="isbnFilter">
        <div class="col">
          <input
            class="form-control form-control-sm ml-3 w-75"
            type="text"
            placeholder="Search by ISBN"
            aria-label="Search"
            v-model="filter.isbn"
            id="isbnFilter"
          />
        </div>

        <div class="col" for="titleFilter">
          <input
            class="form-control form-control-sm ml-3 w-75"
            type="text"
            placeholder="Search by Title"
            aria-label="Search"
            v-model="filter.title"
            id="titleFilter"
          />
        </div>
        <div class="col" for="authorFilter">
          <i class="bi bi-search"></i>
          <input
            class="form-control form-control-sm ml-3 w-75 bi bi-search"
            type="text"
            placeholder="Search by Author"
            aria-label="Search"
            v-model="filter.author"
            id="authorFilter"
          />
        </div>
        <div class="col" for="genreFilter">
          <i class="bi bi-search"></i>
          <input
            class="form-control form-control-sm ml-3 w-75 bi bi-search"
            type="text"
            placeholder="Search by Genre"
            aria-label="Search"
            v-model="filter.genre"
            id="genreFilter"
          />
        </div>
      </div>
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
        genre: "",
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
        )
        .filter((book) => {
          let stringGenre = "";
          book.genreList.forEach((genreObject) => {
            stringGenre += genreObject.genre_name;
          });

          console.log(stringGenre);

          const trimmedGenre = this.filter.genre
            .replace(/ /g, "")
            .toLowerCase();
          console.log(trimmedGenre);

          return stringGenre.toLowerCase().includes(trimmedGenre);
        });
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
.card {
  width: 18rem;
}
.card {
  display: flex;
}


</style>