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