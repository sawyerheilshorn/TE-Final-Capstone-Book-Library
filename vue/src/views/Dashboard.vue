<template>
  <div id="background">
    <book-request-status />
    <view-list />
    <my-library />
  </div>
</template>

<script>
import ViewList from "../components/ViewList.vue";
import MyLibrary from "../components/MyLibrary.vue";
import BookRequestStatus from "../components/BookRequestStatus.vue";

export default {
  components: { ViewList, MyLibrary, BookRequestStatus },
};
</script>

<style scoped>
#background {
  /* background-image: url("../assets/homePage.jpg"); */
 background-color: rgb(244,241,237);
  opacity: 0.95;
}
</style>