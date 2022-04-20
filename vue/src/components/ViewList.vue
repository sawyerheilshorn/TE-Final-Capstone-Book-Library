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
              class="card-img-top"
              v-bind:src="
                'http://covers.openlibrary.org/b/isbn/' + book.isbn + '-M.jpg'
              "
              @click="goToViewerPage(book)"
            />
            <h3>{{ book.title }}</h3>
            <button
              @click="removeBookFromList(list.listId, book)"
              class="btn btn-submit"
              id="remove-book-button"
            >
              Remove Book
            </button>
          </div>

          <!-- <label for="books" >Choose a Book</label> -->
          <h3 for="books">Choose a Book</h3>

          <select name="book" id="books" v-model="selectedInput">
            <option
              v-for="book in myBooks"
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
            id="add-book-btn"
          >
            Add Book
          </button>
          <button
            class="btn btn-submit"
            id="delete-list-btn"
            @click="removeList(list.listId)"
          >
            Delete This List
          </button>
        </div>
      </div>

      <div class="add-list">
        <button id="create-list" @click="formVisible = !formVisible">
          <i class="bi bi-plus-circle"> Add Reading list </i>
        </button>
        <create-list v-if="formVisible" />
      </div>
    </div>
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
      selectedInput: "",
      readingList: [],
      formVisible: false,
      foundBook: {},
      myBooks: [],
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
      return this.myBooks.forEach((book) => {
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

    removeList(listId) {
      ReadingListService.removeList(listId).then((response) => {
        if (response.status === 200) {
          console.log(response);
          this.$router.go(this.$router.currentRoute);
        }
      });
    },

    goToViewerPage(book) {
      this.$router.push({ name: "viewer", params: { isbn: book.isbn } });
    },
  },
  created() {
    ReadingListService.retrieveList().then((response) => {
      this.readingList = response.data;
    });

    BookService.getMyBooks().then((response) => {
      this.myBooks = response.data;
    });
  },
};
</script>



<style scoped>
#remove-book-button {
  text-align: center;
  margin: 0.5% 5% 1% 0%;
  background-color: rgb(244, 241, 237);
  color: black;
}
#add-book-btn {
  text-align: center;
  background-color: rgb(244, 241, 237);
  color: black;
  margin: 0.5% 5% 1% 0%;
}
#delete-list-btn {
  text-align: center;
  background-color: rgb(244, 241, 237);
  color: black;
  border: none;
  margin: 0.5% 5% 1% 0%;
}

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
  /* background-color: burlywood; */
  background-color: rgb(203, 192, 183);
  height: 90%;
  margin-top: 20%;
  margin-bottom: 20%;
}
h2 {
  color: #fff;
  text-align: center;
}
h3 {
  font-size: 16px;
  text-align: center;
  color: black;
  margin-top: 1%;
}
.card-img-top {
  width: 80%;
  height: inherit;
  margin: 0.5% 5% 0.3% 10%;
  object-fit: cover;
}
#create-list {
  height: 4%;
  width: 100%;
  margin-bottom: 5%;
  color: black;
}

.add-list {
  display: flex;
  flex-direction: column;
}
</style>