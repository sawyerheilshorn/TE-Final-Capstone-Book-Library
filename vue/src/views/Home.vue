<template>
  <div>
    <div class="masthead">
      <div class="container h-100">
        <div class="row h-100 align-items-center">
          <div class="col-12 text-center">
            <h1 class="fw-light">Find Your Next Read with CBUS BookSwap</h1>

            <router-link
              v-bind:to="{ name: 'register' }"
              href="#"
              type="button"
              class="btn btn-info"
              >Get Started</router-link
            >
          </div>
        </div>
      </div>
    </div>

    <div class="section2">
      <h5><i class="bi bi-book-fill"></i>+200 Books</h5>
      <h5><i class="bi bi-people-fill"></i> 05 Users</h5>
      <h5><i class="bi bi-book-half"></i> 50 genres</h5>
    </div>
    <div class="devices-section">
      <img id="img" src="../assets/device.png" alt="#" class="img-thumbnail" />
      <div class="text">
        <i class="bi bi-grid-fill" width="32" height="32"></i>
        <h3>Use Any Device</h3>
        <p>
          CBUS BookSwap is a peer to peer library application that helps you
          organize your reading and trade your well worn companions for your
          friends' new and exciting reads. Hey! If you haven't read it it's new
          to you! We firmly believe that books are meant to be enjoyed and
          shared not collected and hoarded.
        </p>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "home",
};
</script>


<style scoped>
@import url("https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css");

.masthead {
  height: 50vh;

  background-image: url("../assets/ReadingBook.jpg");
  background-size: cover;
  background-position: center;
  background-repeat: no-repeat;
}

.container p {
  color: #fff;
  padding: 0%;
  margin: 0%;
  font-size: 150%;
}
.container h1 {
  color: #fff;
  font-size: 400%;
  padding: 0%;
  margin: 0%;
}
.btn {
  background-color: rgb(92, 131, 155);
}

.devices-section {
  display: flex;
  flex-direction: row;
  background-color: rgb(227, 223, 215);
}

.devices-section img {
  width: 55%; /*image width*/

  background-color: rgb(227, 223, 215);
}
.devices-section p {
  display: flex;
  justify-items: center;
}

.devices-section h3 {
  display: flex;
  flex-direction: column;
}
.text {
  margin-top: 15%;
  margin-left: 2%;
  width: 25%;
}

.section2 {
  display: flex;
  justify-content: center;
  padding-left: 10%;
  padding-right: 10%;
  background-color: rgb(210, 199, 190);
}
.section2 h5 {
  display: flex;
  justify-content: center;
  width: 30%;
  padding-top: 1%;
  color: rgb(42, 46, 47);
}
.section2 i {
  padding-right: 1%;
  height: 10px;
}
</style>