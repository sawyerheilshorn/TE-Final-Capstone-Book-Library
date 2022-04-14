<template>
  <main id="home-grid">
    <div class="home">
      <h1 id="slogan">This is our slogan, we like to read books and talk about books and eat books and sleep on books we really like books and people who read books.</h1>
    </div>
  </main>
</template>

<script>
export default {
  name: "home"
};
</script>


<style scoped>
#home-grid {
  display: grid;
  grid-template-columns: 1fr 1fr;
  row-gap: 20px;
  column-gap: 50px;
  grid-template-areas: 
  "slogan"
}

#slogan {
  grid-area: slogan;
  align-items: flex-end;
  text-align: center;
  margin-left: 10%;
  margin-right: 10%;
  width: 1300px;
  font-family: serif;
  background-color: rgb(87, 42, 21);
  border-radius: 10px;
}

@media (max-width: 640px) {
  .quote-card:after {
    font-size:22em;
    right:-25px;
  }
}



</style>