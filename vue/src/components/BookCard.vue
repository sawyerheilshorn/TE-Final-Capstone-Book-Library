<template>
  <div class="card-deck">
    <div
      class="card text-center shadow-lg p-3 mb-5 bg-white rounded col-lg mb-3"
    >
      <img
        v-if="book.isbn"
        v-bind:src="
          'http://covers.openlibrary.org/b/isbn/' + book.isbn + '-M.jpg'
        "
        class="image card-img-top"
        alt=""
      />
      <div class="card-body">
        <h5 class="card-title">{{ book.title }}</h5>
        <h6>{{ "By " + book.author }}</h6>
        <p
          id="inline"
          v-for="genre in book.genreList"
          v-bind:key="genre.id"
          class="card-text"
        >
          {{ genre.genre_name }}
        </p>
        <div v-if="$store.state.token != ''">
          <h6>Users Who Own This Book:</h6>
          <ul>
            <li v-for="user in users" v-bind:key="user.user_id">
              <span v-if="user.username != loggedInUser">
                {{ user.username }}
                <button
                  @click="sendRequest(user.username)"
                  :disabled="enabled == false"
                  class="btn"
                >
                  Request Book
                </button>
              </span>
            </li>
          </ul>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import AuthService from "../services/AuthService";
import RequestService from "../services/RequestService";

export default {
  name: "book-card",
  data() {
    return {
      users: [],
      enabled: true,
      loggedInUser: "",
    };
  },
  props: {
    book: Object,
  },
  created() {
    AuthService.getUsers(this.book.isbn).then((response) => {
      this.users = response.data;
      this.loggedInUser = this.$store.state.user.username;
    });
  },
  methods: {
    sendRequest(username) {
      console.log("Hit Send request method in methods section. Click working");
      RequestService.sendRequest(this.book.isbn, username).then((response) => {
        if (response.status === 200) {
          console.log(response);
        }
        this.enabled = false;
      });
    },
  },
};
</script>

<style>
#inline {
  display: inline;
}

.card-deck {
  margin: 0 1em 1em 1em;
  padding: 1em 1em;
  background-color: rgb(210, 199, 190);
  border-radius: 2%;
  height: 34vw;
}

.card {
  border-radius: 4px;
  box-shadow: 0 6px 10px rgba(0, 0, 0, 0.08), 0 0 6px rgba(0, 0, 0, 0.05);
  transition: 0.3s transform cubic-bezier(0.155, 1.105, 0.295, 1.12),
    0.3s box-shadow,
    0.3s -webkit-transform cubic-bezier(0.155, 1.105, 0.295, 1.12);
  /* padding: 14px 80px 18px 36px; */
  /* cursor: pointer; */
  width: 18rem;
}
.card:hover {
  transform: scale(1.05);
  box-shadow: 0 10px 20px rgba(0, 0, 0, 0.12), 0 4px 8px rgba(0, 0, 0, 0.06);
}

/*.card-img-top{
    height: 50%;
    width: 30%;
  }*/

body {
  background-color: #f4f1ed;
}
.card-img-top {
  width: 100%;
  height: 15vw;
  object-fit: cover;
}

li {
  list-style: none;
}

.btn {
  color: white;
  background-color: lightsalmon;
  margin: 3px;
}

ul {
  display: flex;
  justify-content: space-evenly;
}

p {
  margin-bottom: 3%;
}
</style>