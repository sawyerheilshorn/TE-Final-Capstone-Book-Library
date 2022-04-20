<template>
  <div>
    <div id="myCarousel" class="carousel slide">
      <ol class="carousel-indicators">
        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
        <li data-target="#myCarousel" data-slide-to="1"></li>
        <li data-target="#myCarousel" data-slide-to="2"></li>
        <li data-target="#myCarousel" data-slide-to="3"></li>
      </ol>

      <div class="carousel-inner">
        <div class="banner">
          <div class="carousel-item active" id="slide1">
            <img
              class="d-block w-100"
              src="../assets/ReadingBook.jpg"
              alt="First slide"
            />
            <div class="container">
              <p>Reading opens new worlds</p>
              <h1>Start Reading</h1>
              <a href="#" type="button" class="btn btn-info">Get Started</a>
            </div>
          </div>
          <div class="carousel-item">
            <img
              class="d-block w-100"
              src="../assets/tradeBook.jpeg"
              alt="Second slide"
            />

            <div class="container">
              <p>Reading expands your horizons</p>
              <h1>Swap Books</h1>
              <a href="#" type="button" class="btn btn-info">Get Started</a>
            </div>
          </div>
          <div class="carousel-item">
            <img
              class="d-block w-100"
              src="../assets/bookList.jpg"
              alt="third slide"
            />

            <div class="container">
              <p>Reading enriches young minds</p>
              <h1>Create Your Library</h1>
              <a href="#" type="button" class="btn btn-info">Get Started</a>
            </div>
          </div>
          <div class="carousel-item">
            <img
              class="d-block w-100"
              src="../assets/requestBooks.jpg"
              alt="fourth slide"
            />

            <div class="container">
              <p>Reading is fun</p>
              <h1>Request Books</h1>
              <a href="#" type="button" class="btn btn-info">Get Started</a>
            </div>
          </div>
          <a
            class="carousel-control-prev"
            href="#myCarousel"
            role="button"
            data-slide="prev"
          >
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
          </a>
          <a
            class="carousel-control-next"
            href="#myCarousel"
            role="button"
            data-slide="next"
          >
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
          </a>
        </div>
      </div>
    </div>

    <div class="section2">
      <h5><i class="bi bi-book-fill"></i>+200 Books</h5>
      <h5><i class="bi bi-people-fill"></i> 04 Users</h5>
      <h5><i class="bi bi-book-half"></i> 50 genres</h5>
    </div>
    <div class="devices-section">
      <img id="img" src="../assets/device.png" alt="#" class="img-thumbnail" />
      <div class="text">
        <i class="bi bi-grid-fill" width="32" height="32"></i>
        <h3>Use Any Device</h3>
        <p>
          Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime
          mollitia, molestiae quas vel sint commodi repudiandae consequuntur
          voluptatum laborum numquam blanditiis harum quisquam eius sed odit
          fugiat iusto fuga praesentium optio, eaque rerum! Provident similique
          accusantium nemo autem.
        </p>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "home",
  methods: {},
};
</script>


<style scoped>
@import url("https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css");

.carousel-item {
  height: 32rem;
  background-color: rgb(46, 34, 16);
  text-align: center;
  color: #fff;
  font-weight: bold;
  position: relative;
}

#viewer-container {
  background: black;
}

.container {
  position: absolute;
  bottom: 0;
  left: 0;
  padding: 50px;
}
.carousel-item img {
  position: absolute;
  background-position: center;
  background-size: cover;
  opacity: 0.5;
}

p {
  padding: 0%;
  margin: 0%;
}
.container h1 {
  color: #fff;
  padding: 0%;
  margin: 0%;
}
.btn {
  background-color: rgb(92, 131, 155);
  width: 18%;
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