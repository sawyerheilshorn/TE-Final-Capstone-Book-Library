<template>
  <div id="app">
    <div>
      <nav
        id="main-nav"
        class="navbar sticky-top navbar-expand-lg navbar-custom"
      >
        <div class="container">
          <a class="navbar-brand" href="#">Logo</a>
          <button
            class="navbar-toggler"
            type="button"
            data-toggle="collapse"
            data-target="#collapsibleNavbar"
          >
            <span class="navbar-toggler-icon"></span>
          </button>
          <div class="collapse navbar-collapse" id="collapsibleNavbar">
            <ul class="navbar-nav mr-auto w-100 justify-content-end">
              <li class="nav-item">
                <router-link class="nav-link" v-bind:to="{ name: 'home' }"
                  >Home</router-link
                >&nbsp;&nbsp;
              </li>
              <li class="nav-item">
                <router-link class="nav-link" v-bind:to="{ name: 'search' }"
                  >Search</router-link
                >&nbsp;&nbsp;
              </li>
              <li class="nav-item">
                <router-link class="nav-link" v-bind:to="{ name: 'login' }"
                  >Login</router-link
                >&nbsp;&nbsp;
              </li>
              <li class="nav-item">
                <router-link
                  class="nav-link"
                  v-bind:to="{ name: 'dashboard' }"
                  v-if="$store.state.token != ''"
                  >My Dashboard</router-link
                >&nbsp;&nbsp;
              </li>
              <li class="nav-item">
                <router-link
                  class="nav-link"
                  v-bind:to="{ name: 'logout' }"
                  v-if="$store.state.token != ''"
                  >Logout</router-link
                >
              </li>
            </ul>
          </div>
        </div>
      </nav>
    </div>
    <router-view />
  </div>
</template>

<style>
@import url("https://fonts.googleapis.com/css?family=Titillium+Web");
* {
  font-family: "Titillium Web", sans-serif;
}
body {
  height: 1000px;
}
.navbar .navbar-brand {
  margin-left: 10%;
  font-size: 30px;
  color: rgb(255, 255, 255);
}
.navbar .nav-item {
  padding: 10px 20px;
}
.navbar .nav-link {
  font-size: 20px;
  margin-left: 10px;
  color: aliceblue;
}
.navbar .nav-link:hover {
  color: rgb(126, 141, 223);
}
.fa-bars {
  color: #ff1515;
  font-size: 30px;
}
.navbar-custom {
  background-color: rgb(229 163 102);
}

body {
  background-image: url("assets/homePage.jpg");
}
</style>