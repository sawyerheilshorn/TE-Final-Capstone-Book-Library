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
      localStorage: [],
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
  created() {
    if (localStorage.getItem("reloaded")) {
      // The page was just reloaded. Clear the value from local storage
      // so that it will reload the next time this page is visited.
      localStorage.removeItem("reloaded");
    } else {
      // Set a flag so that we know not to reload the page twice.
      localStorage.setItem("reloaded", "1");
      location.reload();
    }
  },
};
</script>

<style scoped>
#main-div {
  margin-left: 25%;
  margin-top: 5%;
}
#viewerCanvas {
  width: 1000px;
  height: 700px;
}
</style>