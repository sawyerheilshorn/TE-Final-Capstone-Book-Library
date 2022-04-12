<template>
  <div>
      <div v-for="list in readingList" v-bind:key="list.listId">
          <h1> {{list.listName}}</h1>
          </div>
      </div>
</template>

<script>
import ReadingListService from "../services/ReadingListService";

export default {
name:'view-list',
data(){
    return{
      readingList:[]  
    }
},
 created() {
    ReadingListService.retrieveList().then((response) => {
      this.readingList = response.data;
    });
  },
}
</script>

<style>

</style>