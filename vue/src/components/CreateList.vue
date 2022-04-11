<template>
  <div>
      <div id="create_reading_list">
       <form v-on:submit.prevent  class="homeForm">
        <label for="reading_list">Add Reading List</label>
        <input id="reading_list" type="text" v-model="readingList.listName" />        
         <button type="submit" @click="create_reading_list()" class="btn btn-submit">Submit</button>
      <!--button class="btn btn-cancel" type="cancel" v-on:click="cancelForm">Cancel</button-->
      </form>
      </div>
     
  </div>
</template>

<script>
import BookService from "../services/BookService";

export default {
    name: "create-list",
  data() {
    return {      
      readingList:{
          listName:''
      } ,
    };
  },
  methods: {
    createReadingList() {
     
      BookService.createList(this.readingList).then((response) => {
        if (response.status === 200) {
          console.log(response);
        }
      });
    },
  },
};
</script>

<style>
</style>