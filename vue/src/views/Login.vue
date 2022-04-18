<template>
  <body>
  <div id="login" class="text-center">
    <form class="form-signin" @submit.prevent="login">
      <h1 class="h3 mb-3 font-weight-normal">Please Sign In</h1>
      <div class="alert alert-danger" role="alert" v-if="invalidCredentials">
        Invalid username and password!
      </div>
      <div
        class="alert alert-success"
        role="alert"
        v-if="this.$route.query.registration"
      >
        Thank you for registering, please sign in.
      </div>
      <label for="username" class="sr-only">Username</label>
      <input
        type="text"
        id="username"
        class="form-control"
        placeholder="Username"
        v-model="user.username"
        required
        autofocus
      />
      <label for="password" class="sr-only">Password</label>
      <input
        type="password"
        id="password"
        class="form-control"
        placeholder="Password"
        v-model="user.password"
        required
      />
      <router-link :to="{ name: 'register' }">Need an account?</router-link>
      <button id="sign-in" type="submit">Sign in</button>
    </form>
  </div>
  </body>
</template>

<script>
import authService from "../services/AuthService";

export default {
  name: "login",
  components: {},
  data() {
    return {
      user: {
        username: "",
        password: "",
      },
      invalidCredentials: false,
    };
  },
  methods: {
    login() {
      authService
        .login(this.user)
        .then((response) => {
          if (response.status == 200) {
            this.$store.commit("SET_AUTH_TOKEN", response.data.token);
            this.$store.commit("SET_USER", response.data.user);    
            console.log(response.data.user);
            this.$router.push("dashboard");        
          }
         // this.$router.push("dashboard");
        })
        .catch((error) => {
          const response = error.response;

          if (response.status === 401) {
            this.invalidCredentials = true;
          }
        });
    },
  },
};
</script>

<style>

body {
  background-image: url("../assets/request2.jpg");
  background-repeat: no-repeat;
  background-size: 100% 100%;
}

#username {
  width: 30%;
  text-align: center;
  margin-left: 35%;
  margin-bottom: 1%;
  margin-top: 10%;
}
#password {
  width: 30%;
  text-align: center;
  margin-left: 35%;
  margin-bottom: 1%;
}

#sign-in {
  margin-left: 1rem;
  display: inline-block;
  background-color: #7b38d8;
  border-radius: 10px;
  border: 2px double #cccccc;
  color: #eeeeee;
  text-align: center;
  font-size: 20px;
  padding: 5px;
  width: 100px;
  -webkit-transition: all 0.5s;
  -moz-transition: all 0.5s;
  -o-transition: all 0.5s;
  transition: all 0.5s;
  cursor: pointer;
  margin: 5px;
}
h1 {
  color: white;
  background: #1b5e50;
  background-size: 30%;
  width: 100%;
  font-size: 30px;
  padding: 1%;
  margin-top: 2%;
}
</style>