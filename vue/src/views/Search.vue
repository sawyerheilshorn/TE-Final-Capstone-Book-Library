<template>
  <div id="background">
    <body>
    <h1>Search for Books from Library</h1>
    
      <book-list />
    </body>
    
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
  color: rgb(46,34,16);
  font-weight: bold;
}



</style>