<template>
  <div >
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
        
        <label for="books">Choose a Book</label>

            <select name="book" id="books">
              <option v-for="book in $store.state.myLibrary" :value="book.title" :key="book.isbn">{{book.title}} </option>
              
            </select>
            </div>
      </div>


      <button id="create-list" @click="formVisible = !formVisible">
        Add Reading list
      </button>
      <create-list v-if="formVisible" />
    </div>

    >
  </div>
</template>

<script>
import ReadingListService from "../services/ReadingListService";
import CreateList from "./CreateList.vue";

export default {
  components: { CreateList },
  name: "view-list",
  data() {
    return {
      readingList: [],
      formVisible: false,
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
.flex {
  display: flex;

  justify-content: space-evenly;
}
.card {
  background-color: burlywood;
  height: 90%;
  margin-top: 20%;
  margin-bottom: 20%;
}
h2 {
  color: #fff;
}

#create-list {
  height: 10%;
  color: black;
}
</style>