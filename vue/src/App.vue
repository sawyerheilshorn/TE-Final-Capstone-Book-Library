<template>
  <div id="app">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    
    <div>
      <nav class="navbar sticky-top navbar-expand-lg bg-dark">
          <div class="container">
          <a class="navbar-brand" href="#">Logo</a>
         <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
    <span class="navbar-toggler-icon"></span>
  </button>
        <div class="collapse navbar-collapse" id="collapsibleNavbar">
          <ul class="navbar-nav ">
            <li class="nav-item">
              <router-link class="nav-link" v-bind:to="{ name: 'home' }">Home</router-link>&nbsp;&nbsp;
            </li>
            <li class="nav-item">
              <router-link class="nav-link" v-bind:to="{ name: 'search' }">Search</router-link>&nbsp;&nbsp;
            </li>  
            <li class="nav-item">
              <router-link class="nav-link" v-bind:to="{ name: 'Login' }">Login</router-link>&nbsp;&nbsp;
            </li>
            <li class="nav-item">  
              <router-link class="nav-link" v-bind:to="{ name: 'logout' }" v-if="$store.state.token != ''">Logout</router-link>
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
  margin-left: 10% ;
  font-size: 30px;
  color: aliceblue;
}
.navbar .nav-item {
  padding: 10px 20px;
  
}

.navbar .nav-link {
  font-size: 20px;
  margin-left: 10px;
  color: aliceblue;
}
.fa-bars {
  color: #ff1515;
  font-size: 30px;
}



</style>