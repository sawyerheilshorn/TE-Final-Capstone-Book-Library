<template>
  <div>
    <div class="flex row">
      
    <div v-for="list in readingList" v-bind:key="list.listId">
      
      <div class="card">
      <h2>{{ list.listName }}</h2>
      <div
        id="books-in-list"
        v-for="book in list.bookDetailList"
        v-bind:key="book.isbn"
      >
        <img
          v-bind:src="
            'http://covers.openlibrary.org/b/isbn/' + book.isbn + '-M.jpg'
          "
        />
        <h3>{{ book.title }}</h3>
      </div>
      
      </div>
      
      </div>
      <router-link id="create-list" v-bind:to="{ name: 'createList' }"
      >Add Reading list</router-link>
    </div>
    
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

<style scoped>
#create-list {
  margin-top: 23%;
  
  color: white;
}
#books-in-list {
  color: white;
}
.flex{
  display: flex;

  justify-content: space-evenly;
}
.card{
  background-color:burlywood;
  height: 90%;
  margin-top: 20%;
  margin-bottom: 20%;;
}
h2{
  color: #fff;
}

</style>