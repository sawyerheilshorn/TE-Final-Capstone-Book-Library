<template>
  <section class="vh-100" >
  <div class="container py-5 h-100">
    <div class="row d-flex justify-content-center align-items-center h-100">
      <div class="col-12 col-md-8 col-lg-6 col-xl-5" >
         <div class="card shadow-2-strong" style="border-radius: 1rem;">
           <div class="card-body p-5 text-center">
             <h3 class="mb-5">Please Sign In</h3>

                <div >
                  <form class="form-signin" @submit.prevent="login">
                    
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
                    <!-- username  -->
                    <div class="form-outline mb-4">
                      <label for="username" class="sr-only">Username</label>
                      <input type="text" id="username" class="form-control form-control-lg" placeholder="Username" v-model="user.username" required autofocus/>
                    </div>
                    <!-- password -->
                    <div class="form-outline mb-4">
                    <label for="password" class="sr-only">Password</label>
                    <input type="password" id="password" class="form-control form-control-lg"  placeholder="Password" v-model="user.password" required/>
                    </div>

                    <router-link :to="{ name: 'register' }">Need an account?</router-link>
                    <button id="sign-in" class="btn btn-primary btn-lg btn-block" type="submit">Sign in</button>
                  </form>
                </div>
              </div>
  </div>
  </div>
    </div>
  </div>
  </section>
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

<style scoped>
.card{
  height: 600px;
  width: 500px;
  display: flex;
  align-content: center;
}
.card:hover{
    box-shadow: 0 8px 17px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19);
    transition: all .55s ease-in-out;
 }

.btn{
  background-color: rgb(46,34,16);
}
.btn:hover{
  background-color: rgb(165,150,140);
}

</style>