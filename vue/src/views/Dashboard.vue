<template>
  <div>
    <view-list />
    <my-library />
  </div>
</template>

<script>
import ViewList from "../components/ViewList.vue";
import MyLibrary from "../components/MyLibrary.vue";
export default {
  components: { ViewList, MyLibrary },
};
</script>

<style>
</style>