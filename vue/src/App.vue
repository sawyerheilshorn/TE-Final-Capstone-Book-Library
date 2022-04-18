<template>
  <div id="app">
    <!-- <div>
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
    </div> -->

    <div class="nav-container">
      <!-- logo -->
      <nav class="navbar">
        <div class="logo">
          <a href=""> <img src="" alt="" />LOGO </a>
        </div>
        <!-- Nav menu -->
        <div class="menu">
          <ul>
            <li>
              <router-link v-bind:to="{ name: 'home' }">Home</router-link
              >&nbsp;&nbsp;
            </li>
            <li>
              <router-link v-bind:to="{ name: 'search' }">Search</router-link
              >&nbsp;&nbsp;
            </li>
            <li>
              <router-link
                v-bind:to="{ name: 'login' }"
                v-if="$store.state.token == ''"
                >Login</router-link
              >&nbsp;&nbsp;
            </li>
            <li>
              <router-link
                v-bind:to="{ name: 'dashboard' }"
                v-if="$store.state.token != ''"
                >My Dashboard</router-link
              >&nbsp;&nbsp;
            </li>
            <li>
              <router-link
                v-bind:to="{ name: 'logout' }"
                v-if="$store.state.token != ''"
                >Logout</router-link
              >
            </li>
          </ul>
        </div>
      </nav>
    </div>
    <!-- footer -->
    <body class="body">
      <router-view />
    </body>
    <div class="footer" id="footer">
      <div class="footer-bottom">
        <div class="footer-menu">
          <ul class="f-menu">
            <li>
              <router-link v-bind:to="{ name: 'home' }">Home</router-link
              >&nbsp;&nbsp;
            </li>
            <li>
              <router-link v-bind:to="{ name: 'search' }">Search</router-link
              >&nbsp;&nbsp;
            </li>

            <li><a href="">About</a></li>
            <li><a href="">Contact</a></li>
          </ul>

          <p>|| copyright &copy;2022 <a href="#">Cbus Books Swap </a></p>
        </div>
      </div>
    </div>
  </div>
</template>

<style>
/* start of  old app style  */
/* @import url("https://fonts.googleapis.com/css?family=Titillium+Web");
@import url(https://fonts.googleapis.com/css?family=Alegreya+Sans:300);

* {
  font-family: "Titillium Web", sans-serif;
  
}
body { margin: 0%;
  
  min-height: 10vh;
  display: flex;
  flex-direction: column;
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
*/
/* body {
  background-image: url("assets/homePage.jpg");
 
  opacity: .7;
}  */
/* end old app style  */

body {
  min-height: 100vh;
  background-color: rgb(227, 223, 215);
}

a {
  color: inherit;
  text-decoration: none;
}

.navbar-container {
  position: fixed;
  top: 0;
  left: 0;
  margin: 0%;
  width: 100%;
  opacity: 1;
}

.navbar {
  display: flex;
  /* justify-content: space-between; */
  background-color: rgb(46, 34, 16);
  /*   */
}

.logo {
  padding: 20px;
  color: #fff;
}

.menu ul {
  display: flex;
  justify-content: center;
  align-items: center;
  list-style: none;
}

.menu li {
  padding: 20px;
  margin-left: 20px;
  color: #fff;
  font-size: 16px;
  font-weight: bold;
}

.menu ul li:active,
li:focus,
li:hover {
  text-decoration: none;
}

/* footer style */

#footer {
  background-color: rgb(165, 150, 140);
  height: 50px;
  padding: 10px;
  margin-top: auto;
}

.footer-bottom p {
  color: #fff;
  font-size: 14px;
  word-spacing: 2px;
  text-transform: capitalize;
  margin: 0;
}
.footer-bottom p a {
  color: #e6e6e6;
  font-size: 16px;
  text-decoration: none;
}
.footer-bottom span {
  text-transform: uppercase;
  opacity: 0.5;
  font-weight: 200;
}

.footer-menu {
  display: flex;

  justify-content: center;
  margin: 0%;
  padding: 0;
}

.footer-menu ul {
  display: flex;
}

.footer-menu ul li {
  padding-right: 10px;
  display: block;
}

.footer-menu ul li a {
  color: #fff;
  text-decoration: none;
  margin: 0%;
}

.footer-menu ul li a:hover {
  color: #fff;
}

@media (max-width: 500px) {
  .footer-menu ul {
    display: flex;
    margin-top: 10px;
    margin-bottom: 20px;
  }
}

/* end of footer style */
</style>