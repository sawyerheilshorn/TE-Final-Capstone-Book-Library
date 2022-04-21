
<template>
  <div id="app">
    <!-- Nav -->
    <div class="nav-div" id="header">
      <nav class="navbar navbar-expand-lg py-3 navbar-custom">
        <div class="container nav-container">
          <div class="log-background">
          <a href="#" class="navbar-brand">
            <!-- Logo Image -->
            <img
              src="./assets/logo2.png"
              width="13%"
              height="13%"
              alt=""
              class=" "
              id="logo"
            /> 
            <!-- Logo Text -->
            <!-- <span class="text-uppercase font-weight-bold">Company</span> -->
          </a>
          </div>

          <button
            type="button"
            data-toggle="collapse"
            data-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent"
            aria-expanded="false"
            aria-label="Toggle navigation"
            class="navbar-toggler"
          >
            <span class="navbar-toggler-icon"></span>
          </button>

          <div id="navbarSupportedContent" class="collapse navbar-collapse">
            <ul class="navbar-nav ">
              <li class="nav-item active">
                <a href="#" class="nav-link"
                  ><router-link v-bind:to="{ name: 'home' }">Home</router-link
                  >&nbsp;&nbsp;
                </a>
              </li>

              <li class="nav-item active">
                <a href="#" class="nav-link"
                  ><router-link v-bind:to="{ name: 'search' }"
                    >Search</router-link
                  >&nbsp;&nbsp;</a
                >
              </li>

              <li class="nav-item active" v-if="$store.state.token != ''">
                <a href="#" class="nav-link"
                  ><router-link v-bind:to="{ name: 'dashboard' }"
                    >Dashboard</router-link
                  >&nbsp;&nbsp;</a
                >
              </li>

              <li class="nav-item active" v-if="$store.state.token != ''">
                <a href="#" class="nav-link">
                  <router-link v-bind:to="{ name: 'logout' }"
                    >Logout</router-link
                  ></a
                >
              </li>

              <li class="nav-item active" v-if="$store.state.token == ''">
                <a href="#" class="nav-link">
                  <router-link v-bind:to="{ name: 'logout' }"
                    ><router-link v-bind:to="{ name: 'login' }"
                      >Login</router-link
                    >&nbsp;&nbsp;</router-link
                  ></a
                >
              </li>
            </ul>
          </div>
        </div>
      </nav>
    </div>

    <body class="body">
      <router-view />
    </body>

    <!-- footer -->
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
body {
  min-height: 100vh;
  background-color: rgb(227, 223, 215);
}
div .nav-container{
  margin: 0px;
  padding: 0px;
}
a {
  color: inherit;
  text-decoration: none;
}
.navbar-custom {
  background-color: rgb(165, 150, 140);
  /* rgb(84,57,41) */
  color: white;
}
#logo{
  height: 30%;
  width: 25%;
  margin-left: 30%;
 }
.navbar-nav{
  margin-left: 170%;
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
  margin: 0%;
  padding: 0;
 
}

.footer-menu ul li {
  padding-right: 10px;
  
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
 
  .footer-menu  {
    display: flex;
    flex-direction: column;
  }
}
</style>