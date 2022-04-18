<template>
  <div id="background">
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

<style scoped>
.main {
  width: 50%;
  margin: 50px auto;
}

h1 {
  text-align: center;
  margin: 1em 1em;
  color: white;
  font-weight: bold;
}

#background {
  background-image: url("../assets/searchPageImage.jpg");
}
</style>