<template>
  <div>
     <book-request-status/>
    <view-list />
    <my-library />
   
  </div>
</template>

<script>
import ViewList from "../components/ViewList.vue";
import MyLibrary from "../components/MyLibrary.vue";
import BookRequestStatus from '../components/BookRequestStatus.vue';

export default {
  components: { ViewList, MyLibrary, BookRequestStatus },
};
</script>

<style>

</style>