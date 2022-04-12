<template>
  <div>
    <div v-for="list in readingList" v-bind:key="list.listId">
      <h1>{{ list.listName }}</h1>
    </div>
    <router-link v-bind:to="{ name: 'createList' }"
      >Add Reading list</router-link
    >
  </div>
</template>

<script>
import ReadingListService from "../services/ReadingListService";

export default {
  name: "view-list",
  data() {
    return {
      readingList: [],
    };
  },
  created() {
    ReadingListService.retrieveList().then((response) => {
      this.readingList = response.data;
    });
  },
};
</script>

<style>
</style>