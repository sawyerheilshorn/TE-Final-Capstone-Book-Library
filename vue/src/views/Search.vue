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
/* Styles for wrapping the search box */

.main {
    width: 50%;
    margin: 50px auto;
}

h1{
  text-align: center;
  margin: 1em 1em;
}
/* Bootstrap 4 text input with search icon */

.has-search .form-control {
    padding-left: 2.375rem;
}

.has-search .form-control-feedback {
    position: absolute;
    z-index: 2;
    display: block;
    width: 2.375rem;
    height: 2.375rem;
    line-height: 2.375rem;
    text-align: center;
    pointer-events: none;
    color: #aaa;
}
</style>