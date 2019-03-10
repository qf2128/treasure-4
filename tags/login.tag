<login>

<div class="containter">
  <!-- Image part -->
  <div class="row">
    <div class="col" hide={this.stats}>
      <img src = "./asset/{welcomeImage}.jpg" alt="ship" style="width:500px;height:500px;" class="center">
    </div>
  </div>

  <!--Title part -->
  <div class="row">
    <h1 class="center2" hide={this.state}> TREASURE </h1>
  </div>

  <!-- Button part -->
  <div class="row">
    <div class="button1">
      <button type="button" class="btn btn-primary" name="button" onclick={stateLogin} hide={this.state} >Log in</button>
    </div>
    <div class="button2">
      <button type="button" class="btn btn-primary" name="button" onclick={stateSignup} hide={this.state}>Sign up</button>
    </div>
  </div>


<newUser if={this.state==="stateSignup"}></newUser>
<oldUser if={this.state==="stateLogin"}></oldUser>
    </div>

<script>
observer.on('stats', (stats)=>{
  this.stats=stats
  this.update()
})


this.welcomeImage = "pirateship";
this.state="";
console.log('state',this.state);
stateSignup(){
    this.state="stateSignup";
}
stateLogin(){
    this.state="stateLogin"
}

</script>

<style>
    :scope{}


 .center{
   margin-left:27%;

}
 .center2{
  text-align: center;
  width: 100%;
 }

 .button1{
   margin-left: 30%;
 }

 .button2{
   margin-left: 27%;
 }

</style>
</login>
