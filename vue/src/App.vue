<template>
  <div id="app">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <div id="nav">
      <nav class="navbar sticky-top navbar-expand-lg bg-dark">
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
          <ul class="navbar-nav mr-auto w-100 justify-content-end">
            <li class="nav-item">
              <router-link class="nav-link" v-bind:to="{ name: 'home' }">Home</router-link>&nbsp;|&nbsp;
            </li>
            <li class="nav-item">
              <router-link class="nav-link" v-bind:to="{ name: 'search' }">Search</router-link>&nbsp;|&nbsp;
            </li>  
            <li class="nav-item">
              <router-link class="nav-link" v-bind:to="{ name: 'Login' }">Login</router-link>&nbsp;|&nbsp;
            </li>
            <li class="nav-item">  
              <router-link class="nav-link" v-bind:to="{ name: 'logout' }" v-if="$store.state.token != ''">Logout</router-link>
            </li>  
          </ul>
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
  font-size: 30px;
}
.navbar .nav-item {
  padding: 10px 20px;
}
.navbar .nav-link {
  font-size: 20px;
  margin-left: 10px;
}
.fa-bars {
  color: #007bff;
  font-size: 30px;
}



</style>