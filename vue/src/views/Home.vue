<template>
  <div>
    <div>
      <div class="jumbotron jumbotron-fluid">
        <div class="container">
          <div class="content">
          <h1 class="display-4">Logo will be here </h1>
          <p class="lead">Trade read and add your favorite books.</p>
          <button type="button" class="btn btn-primary">Get Started</button>
        </div>
  </div>
</div>
    </div>
  </div>
</template>

<script>
export default {
  name: "home"
};
</script>


<style scoped>
.jumbotron {
  padding: 100px;
  margin: 0;
  background-image:  url("../assets/tradeBook.jpeg");
  background-size: cover;
  background-repeat: no-repeat; 
  background: #726ea3;
  opacity: .7;
  z-index: -1;
  
}

 

.content{
  text-align: center;
  color: #fff;
  font-weight: bold;

}



</style>