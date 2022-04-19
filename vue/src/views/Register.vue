<template>
<section class="vh-100" >
  <div class="container py-5 h-100">
    <div class="row d-flex justify-content-center align-items-center h-100">
      <div class="col-12 col-md-8 col-lg-6 col-xl-5" >
         <div class="card shadow-2-strong" style="border-radius: 1rem;">
           <div class="card-body p-5 text-center"> 
             <h3 class="h3 mb-3 font-weight-normal">Create Account</h3>


  <div id="" class="">
    <form class="f" @submit.prevent="register">
     
      <div class="alert alert-danger" role="alert" v-if="registrationErrors">
        {{ registrationErrorMsg }}
      </div>

                    <div class="form-outline mb-4">
                      <label for="username" class="sr-only">Username</label>
                      <input type="text" id="username" class="form-control form-control-lg" placeholder="Username" v-model="user.username" required autofocus/>
                    </div>
                    <!-- password -->
                    <div class="form-outline mb-4">
                    <label for="password" class="sr-only">Password</label>
                    <input type="password" id="password" class="form-control form-control-lg"  placeholder="Password" v-model="user.password" required/>
                    </div>
                    
                    <div class="form-outline mb-4">
                    <input type="password" id="confirmPassword" class="form-control form-control-lg" placeholder="Confirm Password" v-model="user.confirmPassword" required/>
                    </div>
      <router-link :to="{ name: 'login' }" >Have an account?</router-link>
      <button id="createAccount" class="btn btn-lg btn-primary btn-block" type="submit">
        Create Account
      </button>
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
import authService from '../services/AuthService';

export default {
  name: 'register',
  data() {
    return {
      user: {
        username: '',
        password: '',
        confirmPassword: '',
        role: 'user',
      },
      registrationErrors: false,
      registrationErrorMsg: 'There were problems registering this user.',
    };
  },
  methods: {
    register() {
      if (this.user.password != this.user.confirmPassword) {
        this.registrationErrors = true;
        this.registrationErrorMsg = 'Password & Confirm Password do not match.';
      } else {
        authService
          .register(this.user)
          .then((response) => {
            if (response.status == 201) {
              this.$router.push({
                path: '/login',
                query: { registration: 'success' },
              });
            }
          })
          .catch((error) => {
            const response = error.response;
            this.registrationErrors = true;
            if (response.status === 400) {
              this.registrationErrorMsg = 'Bad Request: Validation Errors';
            }
          });
      }
    },
    clearErrors() {
      this.registrationErrors = false;
      this.registrationErrorMsg = 'There were problems registering this user.';
    },
  },
};
</script>

<style scoped>
.card{
  height: 600px;
  width: 500px;
  display: flex;
  
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
