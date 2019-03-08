<play>

<button type="button" class="btn btn-primary" name="button" onclick={startPlay} >start play</button>

<p if={this.playState==="startPlay"}> No.{this.turns} turn: The treasure value is {this.treasure}</p>
<p if={this.playCardState==="CardPlay"}> {this.userName} has a total treasure value of {this.userTotalTeasure}.</p>
<p if={this.playCardState==="CardPlay"}> {this.opponent} has a total treasure value of {this.oppoTotalTeasure}.</p>
<div class="">
<button type="button" class="btn btn-success mr-md-2" name={item} id={item} onclick={playCard} each={item, i in allCards} show={this.playState==="startPlay"} >{item}</button>
</div>





<script>
let tag=this;
this.allCards=[1,2,3,4,5,6,7,8,9,10,11,12,13]
this.playState=""
this.btnCount=0
this.treasure=""
this.turns="1";
this.youTotalTeasure=0;
this.oppoTotalTeasure=0;
var userName=this.parent.parent.userName;
this.userName=userName
console.log('userName',userName)
this.userInfo=[{
    myName:userName
}]

observer.on('play:treasure',(treasure)=>{
 this.treasure=treasure
 this.update()
 console.log('frind trasure', this.treasure)
})

startPlay(){
 console.log('this',event.target);
    this.playState="startPlay";
}


playCard(){
    this.gameId=this.parent.gameId;
    this.userId=this.parent.userId;
    var userId=this.userId;
    this.userInfo.push({
        myId: userId
    })
    this.cardNumber=event.target.name;
     document.getElementById(this.cardNumber).style.color = "black";

    fetch('http://treasure.chrisproctor.net/players/'+ this.userId +'/games/' +this.gameId + '/play/' + this.cardNumber).then(response => {
         return response.json();
     }).then(data => {

         this.oppoTurns="";
         var decideTurns=data.turns[0];
         this.treasure=decideTurns.treasure;
         console.log('treasure',this.treasure);
         var i=0;
         for (var key in decideTurns){
         i=i+1
         };
           console.log('iiii',i);
            if (i==1) {
                var currentTurns=data.turns[1];
                for (var key in currentTurns){
                    if (key !=userName && key!="treasure"){
                        this.oppoTurns=currentTurns[key]
                        alert(this.opponent +":"+this.oppoTurns)
                    }
                    }
            } else {
                alert("opponent hasn't play")
            }

         console.log('xLABEL:', data)
         var players=data.players
         console.log('players',players)
         for (var key in players){
            if(key!=userName){
                this.opponent=key
                this.oppoTotalTeasure=players[key].score
                console.log('total 2',this.oppoTotalTeasure)
            } else {
                this.userTotalTeasure=players[key].score
                console.log('total 1',this.userTotalTeasure)
            }
        }

             this.userTotalTeasure=data.players[userName].score
         // Work with JSON data her

     this.turns=data.turns.length;
     alert("This button is disabled afterward.");
     this.playCardState="CardPlay";
     this.update();
 })

}

setTimeout(function(){
    fetch('http://treasure.chrisproctor.net/players/'+ this.userId +'/games/' +this.gameId + '/play/' + this.cardNumber).then(response => {
         return response.json();
     }).then(data=> {

     })
}, 1000);


</script>


<style>
.statebu{
 height:20px;
 width:80px;
}
</style>
</play>
