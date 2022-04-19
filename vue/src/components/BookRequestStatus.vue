<template>
  <div>
    <button id="viewRequestButton" @click="visible = !visible">
      <i class="bi bi-chat-square-text"> View My Requests</i>
    </button>
    <div id="book-status" v-if="visible == true">
      <div id="received-request">
        <!-- Request received by the user -->
        <h2>Requests Received</h2>

        <div
          v-for="request in requestReceived.slice(0, 3)"
          v-bind:key="request.book_isbn"
        >
          <p>{{ request.title }} From : {{ request.requestSender }}</p>
          <button
            v-if="request.transferStatus == 1"
            type="submit"
            @click="approveBookRequest(request)"
            class="new-btn"
          >
            <i class="bi bi-check2-square"> Approve</i>
          </button>
          <button
            v-if="request.transferStatus == 1"
            type="submit"
            @click="declineBookRequest(request)"
            class="new-btn"
          >
            <i class="bi bi-x-octagon"> Decline</i>
          </button>
          <button v-if="request.transferStatus == 2" class="new-btn">
            <i class="bi bi-check2-square"> Approved</i>
          </button>
          <button v-if="request.transferStatus == 3" class="new-btn">
            <i class="bi bi-x-octagon"> Declined</i>
          </button>
        </div>
      </div>
      <!-- Request sent by the user -->
      <div id="sent-request">
        <h2>My Requests</h2>
        <div
          v-for="request in requestSent.slice(0, 3)"
          v-bind:key="request.book_isbn"
        >
          <p>{{ request.title }} To: {{ request.borrowFrom }}</p>
          <button v-if="request.transferStatus == 1" class="new-btn">
            <i class="bi bi-hourglass-split"> Pending</i>
          </button>
          <button v-if="request.transferStatus == 2" class="new-btn">
            <i class="bi bi-check2-square"> Approved</i>
          </button>
          <button v-if="request.transferStatus == 3" class="new-btn">
            <i class="bi bi-x-octagon"> Declined</i>
          </button>
        </div>
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
      visible: false,
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
#viewRequestButton {
  margin: 0.2% 0 0.3% 46%;
  width: 210px;
}

#received-request {
  display: grid;
  color: white;
  background-color: rgb(203, 192, 183);
  grid-area: received-request;
  border: none;
}

.new-btn {
  width: 30%;
  text-align: center;
}

#sent-request {
  color: white;
  background-color: rgb(203, 192, 183);
  /* margin: 1px;   */
  grid-area: sent-request;

  border: none;
}

#book-status {
  display: grid;
  text-align: center;
  grid-template-areas: "received-request sent-request";
}

#received-request {
  width: 50%;
  margin-left: 50%;
}
#sent-request {
  width: 50%;
}
</style>