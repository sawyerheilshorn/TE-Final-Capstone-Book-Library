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
            <button
              @click="removeBookFromList(list.listId, book)"
              class="btn btn-submit"
            >
              Remove Book
            </button>
          </div>

          <label for="books">Choose a Book</label>

          <select name="book" id="books" v-model="selectedInput">
            <option
              v-for="book in $store.state.myLibrary"
              :value="book.title"
              :key="book.isbn"
            >
              {{ book.title }}
            </option>
          </select>
          <button
            type="submit"
            @click="addBookToList(list.listId)"
            class="btn btn-submit"
            id="btn-submit"
          >
            Add Book
          </button>
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
import BookService from "../services/BookService";
import ReadingListService from "../services/ReadingListService";
import CreateList from "./CreateList.vue";

export default {
  components: { CreateList },
  name: "view-list",
  data() {
    return {
      // selectedBook: {
      //   isbn: "",
      //   title: "",
      //   author: "",
      //   genreList: [
      //     {
      //       genre_name: "",
      //     },
      //   ],
      // },
      selectedInput: "",
      readingList: [],
      formVisible: false,
      foundBook: {},
    };
  },
  computed: {},
  methods: {
    addBookToList(listId) {
      this.findBookByName();

      BookService.addBookToList(this.foundBook, listId).then((response) => {
        console.log(response);
        ReadingListService.retrieveList().then((response) => {
          this.readingList = response.data;
          console.log(this.readingList);
        });
      });
    },
    findBookByName() {
      return this.$store.state.myLibrary.forEach((book) => {
        if (book.title == this.selectedInput) {
          console.log("Book found" + JSON.stringify(book));

          this.foundBook = book;
        }
      });
    },

    removeBookFromList(listId, book) {
      ReadingListService.removeBookFromList(listId, book.isbn).then(
        (response) => {
          console.log(response);
          ReadingListService.retrieveList().then((response) => {
            this.readingList = response.data;
            console.log(this.readingList);
          });
        }
      );
    },
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