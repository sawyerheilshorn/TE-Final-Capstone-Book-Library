<template>
  <div id="book-status">
    <div id="received-request">
      <!-- Request received by the user -->
      <h2>Request Received</h2>

      <div
        v-for="request in requestReceived.slice(0, 3)"
        v-bind:key="request.book_isbn"
      >
        <p>
          {{ request.title }} &nbsp; &nbsp; From : {{ request.requestSender }}
        </p>
        <button
          v-if="request.transferStatus == 1"
          type="submit"
          @click="approveBookRequest(request)"
          class="btn"
        >
          Approve
        </button>
        <button
          v-if="request.transferStatus == 1"
          type="submit"
          @click="declineBookRequest(request)"
          class="btn"
        >
          Decline
        </button>
        <button v-if="request.transferStatus == 2" class="btn">Approved</button>
        <button v-if="request.transferStatus == 3" class="btn">Declined</button>
      </div>
    </div>
    <!-- Request sent by the user -->
    <div id="sent-request">
      <h2>My Request</h2>
      <div
        v-for="request in requestSent.slice(0, 3)"
        v-bind:key="request.book_isbn"
      >
        <p>{{ request.title }} To: {{ request.borrowFrom }}</p>
        <button v-if="request.transferStatus == 1" class="btn">Pending</button>
        <button v-if="request.transferStatus == 2" class="btn">Approved</button>
        <button v-if="request.transferStatus == 3" class="btn">Declined</button>
      </div>
    </div>
  </div>
</template>

<script>
import RequestService from "../services/RequestService";
import BookService from "../services/BookService";
export default {
  name: "book-request",
  data() {
    return {
      bookRequests: [],
      requestSent: [],
      requestReceived: [],
      username: "",
    };
  },
  created() {
    RequestService.getBookStatus().then((response) => {
      console.log("BOOK REQUEST: " + response.data);
      this.bookRequests = response.data;
      this.username = this.$store.state.user.username;

      this.bookRequests.forEach((bookRequest) => {
        if (bookRequest.requestSender == this.username) {
          this.requestSent.push(bookRequest);
          //   console.log("requestSender: " + JSON.stringify(this.requestSent));
        } else {
          this.requestReceived.push(bookRequest);
          //   console.log("requestReceived: " + JSON.stringify(this.requestReceived));
        }
      });
    });
  },
  methods: {
    approveBookRequest(request) {
      request.transferStatus = 2;
      RequestService.updateStatus(request).then((response) => {
        if (response.status === 200) {
          console.log(response);
        }
        BookService.getMyBooks().then((response) => {
          this.myBooks = response.data;
          this.$store.commit("ADD_ALL_BOOK", this.myBooks);
        });
        this.$router.go(this.$router.currentRoute);
      });
    },

    declineBookRequest(request) {
      request.transferStatus = 3;
      RequestService.updateStatus(request).then((response) => {
        if (response.status === 200) {
          console.log(response);
        }
      });
    },
  },
};
</script>

<style scoped>
#received-request {
  display: grid;
  color: white;
  background-color: rgb(74, 78, 78);
  margin: 1px;
  grid-area: received-request;
}

.btn {
  color: white;
  background-color: lightsalmon;
  margin: 3px;
}

#sent-request {
  color: white;
  background-color: rgb(74, 78, 78);
  /* margin: 1px;   */
  grid-area: sent-request;
}

#book-status {
  display: grid;
  /* row-gap: 20px; */
  /* column-gap: 50px;  */

  grid-template-areas: "received-request sent-request";
}
</style>