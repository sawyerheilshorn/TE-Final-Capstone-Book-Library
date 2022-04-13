<template>
  <div class="home">

    <div class="quote">
    
<blockquote class="quote-card yellow-card ">
<p>Your quote here. Edit it however you want. You can change the color by making changes to the CSS file. The code and CSS of Bootstrap 4 is in the associated tutorial zip file.
</p>
<cite>quote attribution</cite>
</blockquote>
   
  </div>
  </div>
</template>

<script>
export default {
  name: "home"
};
</script>


<style scoped>
.quote{
  
}
.quote-card { 
 

  background:#fff;
  color:#222222;
  padding:20px;
  padding-left:50px;
  box-sizing:border-box;
  box-shadow:0 2px 4px rgba(34, 34, 34, 0.12);
  position:relative;
  overflow:hidden;
  min-height:120px;
}

.quote-card p {
  font-size:22px;
  line-height:1.5;
  margin:0;
  max-width:80%;
}

.quote-card cite {
  font-size:16px;
  margin-top:10px;
  display:block;
  font-weight:200;
  opacity:0.8;
}

.quote-card:before {
  font-family:Georgia, serif;
  content: "\201c";
  position:absolute;
  top:10px;
  left:10px;
  font-size:5em;
  color:rgba(238, 238, 238, 0.8);
  font-weight:normal;
}

.quote-card:after {
  font-family:Georgia, serif;
  content: "\201d";
  position:absolute;
  bottom:-110px;
  line-height:100px;
  right:-32px;
  font-size:25em;
  color:rgba(238, 238, 238, 0.8);
  font-weight:normal;
}

@media (max-width: 640px) {
  .quote-card:after {
    font-size:22em;
    right:-25px;
  }
}



</style>