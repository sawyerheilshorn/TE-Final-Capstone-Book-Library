<template>
  <div>
    <h1>{{ book.title }}</h1>
    <img
      v-if="book.isbn"
      v-bind:src="
        'http://covers.openlibrary.org/b/isbn/' + book.isbn + '-M.jpg'
      "
    />
    <h3>{{ book.author }}</h3>
    <h4 v-for="genre in book.genreList" v-bind:key="genre.id">
      {{ genre.genre_name }}
    </h4>
    <div class="card">
      <img src="../img/book.jpg" class="card-img-top" alt="#" />
      <div class="card-body">
        <h5 class="card-title">Book title</h5>
        <p class="card-text">
          Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do
          eiusmod tempor incididunt ut labore et dolore magna aliqua.
        </p>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "book-card",
  props: {
    book: Object,
  },
};
</script>

<style scoped>

div {
  display: flex;
  justify-content: space-around;
}


</style>