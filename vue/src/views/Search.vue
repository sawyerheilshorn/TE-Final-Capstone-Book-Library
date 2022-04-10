<template>
  <div>
    <h1>Search for Books from Library</h1>
    <book-list />
  </div>
</template>

<script>
import BookList from "../components/BookList.vue";
export default {
  components: {
    BookList,
  },
  name: "Search",
};
</script>

<style>
</style>