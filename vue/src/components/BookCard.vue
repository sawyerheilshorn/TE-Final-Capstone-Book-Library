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
    <h4 v-for="genre in book.genre" v-bind:key="genre.id">{{ genre }}</h4>
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

<style>
</style>