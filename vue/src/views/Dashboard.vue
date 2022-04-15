<template>
  <div>
    <view-list />
    <my-library />

    <footer class="footer">
    <div class="container">
        <div class="row">
            <div class="col-md-5">
                <h5><i class="fa fa-road"></i> Book Bucket llc.</h5>
                <div class="row">
                    <div class="col-6">
                        <ul class="list-unstyled">
                            <li><a href="">Popular Books</a></li>
                            <li><a href="">New Books</a></li>
                            <li><a href="">Community</a></li>
                            <li><a href="">Team</a></li>
                        </ul>
                    </div>
                    <div class="col-6">
                        <ul class="list-unstyled">
                            <li><a href="">Documentation</a></li>
                            <li><a href="">Support</a></li>
                            <li><a href="">Legal Terms</a></li>
                            <li><a href="">About</a></li>
                        </ul>
                    </div>
                </div>
                <ul class="nav">
                    <li class="nav-item"><a href="" class="nav-link pl-0"><i class="fa fa-facebook fa-lg"></i></a></li>
                    <li class="nav-item"><a href="" class="nav-link"><i class="fa fa-twitter fa-lg"></i></a></li>
                    <li class="nav-item"><a href="" class="nav-link"><i class="fa fa-github fa-lg"></i></a></li>
                    <li class="nav-item"><a href="" class="nav-link"><i class="fa fa-instagram fa-lg"></i></a></li>
                </ul>
                <br>
            </div>
            <div class="col-md-2">
                <h5 class="text-md-right">Contact Us</h5>
                <hr>
            </div>
            <div class="col-md-5">
                <form>
                    <fieldset class="form-group">
                        <input type="email" class="form-control" id="exampleInputEmail1" placeholder="Enter email">
                    </fieldset>
                    <fieldset class="form-group">
                        <textarea class="form-control" id="exampleMessage" placeholder="Message"></textarea>
                    </fieldset>
                    <fieldset class="form-group text-xs-right">
                        <button type="button" class="btn btn-secondary-outline btn-lg">Send</button>
                    </fieldset>
                </form>
            </div>
        </div>
    </div>
</footer>
  </div>
</template>

<script>
import ViewList from "../components/ViewList.vue";
import MyLibrary from "../components/MyLibrary.vue";
export default {
  components: { ViewList, MyLibrary },
};
</script>

<style>



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



body {
    font-family: 'Alegreya Sans', sans-serif;
}

html {
  position: relative;
  min-height: 100%;
}

.footer { 
  margin-top: auto;
  color: #fff;
  
}

@media (max-width: 34em) {
    body {
      margin-bottom: 500px;
    }
    .footer {
      padding: 3em;
      height: 500px;
    }
}

footer {
  padding-top: 30px;
  background-color: rgba(219, 176, 148, 0.972);
  color: #bbb;
}

footer a {
  color: #fff;
  text-decoration:none;
}

footer a:hover, footer a:focus {
  color: #fff;
  text-decoration:none;
  border-bottom:1px dotted #999;
}

footer .form-control {
    background-color: #1f2022;
    box-shadow: 0 1px 0 0 rgba(255, 255, 255, 0.1);
    border: none;
    resize: none;
    color: #d1d2d2;
    padding: 0.7em 1em;
}
</style>