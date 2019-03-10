<newUser>
  <div class= "center">
    <h1 hide={ loginState==="oldUser" || loginState === "readyToGo"}> Ahoy there Matey !</h1>
  </div>
  <div class="row">
    <div class="left">
      <input class="newName" type="text" value="" placeholder="input your new name" ref="userName" hide={ loginState==="oldUser" || loginState==="readyToGo"}>
    </div>
    <div class="right">
      <button type="button" onclick="{getChrisDataNewId}"  class="btn btn-primary" hide={ loginState==="oldUser" || loginState==="readyToGo"}>SUBMIT</button>
    </div>
    <div show={ loginState==="oldUser"} class="reveal">
      <h1> Ahoy there {this.userName} !</h1>
      <h2>This is your User ID: {this.userId} </h2>
      <p>Remember it well...or else...</p>
      <button type="button" onclick="{readyToStart}"  class="btn btn-primary" hide={ loginState==="readyToGo"}> CONTINUE</button>
    </div>
 <oldUser show={ loginState==="readyToGo"}></oldUser>

<script>
let tag=this;
console.log(this);
this.userName="";

getChrisDataNewId(){
   this.userName=this.refs.userName.value;

  fetch('http://treasure.chrisproctor.net/players/new/' + this.userName).then(response => {
        return response.json();
    }).then(data => {
        // Work with JSON data here
        this.userId=data.pid;
        this.loginState="oldUser"
         this.update();
    });

  }

readyToStart(){
  this.loginState="readyToGo"
}
</script>


<style>
:scope{}

.newName{
  font-size: 25px;
}

.center{
  display: block;
  margin-left: 30%;
}

.left{
  margin-left:30%;
}

.right{
  margin-left: 10%;
}

.reveal{
 width:100%;
 text-align: center;

}
</style>
</newUser>
