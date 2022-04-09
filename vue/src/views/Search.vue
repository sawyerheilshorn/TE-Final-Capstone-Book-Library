<template>
  <div>
    <book-card
      v-bind:book="book"
      v-for="book in fileredBooks"
      v-bind:key="book.isbn"
    />
  </div>
</template>

<script>
import BookCard from "../components/BookCard.vue";
export default {
  name: "Search",
  components: {
    BookCard,
  },
  data() {
    return {
      books: [],
    };
  },
  created() {},
};
</script>

<style>
</style>