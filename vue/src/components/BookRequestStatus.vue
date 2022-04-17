<template>
  <div class="book-status">
    <h2>My Request  {{username.username}}</h2>

    <div v-for="request in bookRequests" v-bind:key="request.book_isbn">
      <p>{{ request.title }} &nbsp; &nbsp; {{ request.requestSender }}</p>
    </div>
  </div>
</template>

<script>
import ReadingListService from "../services/ReadingListService";
export default {
  name: "book-request",
  data() {
    return {
      bookRequests: [],
      username: "",
    };
  },
  created() {
    ReadingListService.getBookStatus().then((response) => {
      console.log("BOOK REQUEST: " + response.data);
      this.bookRequests = response.data;
      this.username = this.$store.state.user;
    });
  },
};
</script>

<style scoped>
.book-status {
  color: white;
}
</style>