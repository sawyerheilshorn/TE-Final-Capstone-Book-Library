<template>
  <div id="main-div">
    <div id="viewerCanvas"></div>
  </div>
</template>

<script>
const google = window.google;
export default {
  data() {
    return {
      isbn: "",
    };
  },

  props: {
    book: Object,
  },
  mounted() {
    google.books.load();
    let bookToLoad = "ISBN:" + this.$route.params.isbn;
    function initialize() {
      var viewer = new google.books.DefaultViewer(
        document.getElementById("viewerCanvas")
      );
      viewer.load(bookToLoad);
    }

    google.books.setOnLoadCallback(initialize);
  },
};
</script>

<style scoped>
#viewerCanvas {
  width: 100%;
  height: 100%;
}
</style>