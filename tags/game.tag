<game>
  <div class="container" hide={this.gameState||this.state==="join"}>
   <div class="buttons" hide={this.state==="newGame"||this.state==="join"}>
        <button type="button" class="btn btn-primary btn-lg" name="button" onclick={newGame} style="margin-right:5%">Create New Game</button>
        <button type="button" class="btn btn-primary btn-lg" name="button" onclick={join} style="margin-right:5%">Join A Game</button>
        <button type="button" name="button"  class="btn btn-primary btn-lg" onclick={resume}>Resume Previous Game</button>
        <play if={this.gameState==="autoplay"}></play>
   </div>

   <div class="row1" if={this.state==="newGame"} hide={this.gameState==="autoplay"}>
        <h2> Choose your opponent</h2>
        <select class="custom-select" name="" onchange={updateNewGameType}>
            <option value="">---</option>
            <option value="autoplay">Play against a Bot</option>
            <option value="invite">Play against a friend</option>
        </select>
   </div>

   <div class="tellID" show={this.gameState==="invite"}>
     <p> Please give your friend the room Id:  {this.gameId} </p>
   </div>
  </div>

  <div if={this.gameState==="invite"}>
     <p>Get ready to play with your friend</p>
     <button type="button" name="button" class="btn btn-primary" onclick={startGameFriend}>Start game</button>
  </div>

  <div class="">
    <play if={this.gameState==="autoplay"}||{this.gameState==="readyWithFriends"} hide={!this.gameState}></play>
  </div>

  <joinFriend if={this.gameState==="join"}></joinFriend>




<script>
this.state=""
this.userInfo=[{
    myName:this.parent.userName
}]
this.userName=this.parent.userName
console.log('game this', this)
observer.on('userId',(userId)=>{
    this.userId=userId;
    this.userInfo.push({
        myId:userId
    });
     console.log('infooo',this.userInfo)
     });

observer.trigger('userInfo', this.userInfo)

newGame(){
    this.state="newGame";
    console.log('this',this)
       fetch('http://treasure.chrisproctor.net/players/'+ this.userId +'/games/new').then(response => {
            return response.json();
        }).then(data => {
            this.gameId=data.gid
            // Work with JSON data here
        });
    }

updateNewGameType(){
    console.log('select',this);
   this.gameState=event.target.value
console.log('select',this.gameState)
   if (this.gameState=="autoplay"){
       fetch('http://treasure.chrisproctor.net/players/'+ this.userId +'/games/' + this.gameId + '/autoplay').then(response => {
            return response.json();
        }).then(data => {
            console.log('autoplay',data)
       treasure=data.turns[0].treasure
            observer.trigger('play:treasure',treasure);
        this.update();
            // Work with JSON data here
        });
   }

   if(this.gameState=="invite"){
       alert("please tell your friend your room Id:" + this.gameId)
       this.gameState="readyWithFriends";
       console.log('with friends',this.userId)
       console.log('with friends',this.gameId)
       fetch('http://treasure.chrisproctor.net/players/'+ this.userId +'/games/' + this.gameId).then(response => {
            return response.json();
        }).then(data => {
            console.log(data)
            // Work with JSON data here
       var treasure=data.turns[0].treasure
         observer.trigger('play:treasure',treasure)
        });

       //this.update();
   }
}



join(){
    this.state="join";
}

</script>

<style>
 :scope{}

 .container {
     background-image: url(./asset/map.jpg);
     background-repeat:no-repeat;
     height:1000px;
   }
 .buttons {
   padding-top: 30%;
   padding-left: 13%;
 }

 .row1 {
   padding-top: 30%;
   padding-left: 20%;
   margin-right: 40%;
 }

</style>

</game>
