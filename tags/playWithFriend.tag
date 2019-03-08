<playBot>

<button type="button" class="btn btn-primary" name="button" onclick={startPlay} >start play</button>

<p if={this.playState==="startPlay"}> No.{this.turns} turn: The treasure value is {treasure}. </p>
<p if={this.playState==="startPlay"}> The total value of your treasure is now {this.youTotalTeasure}.</p>
<p if={this.playState==="startPlay"}> The total value of your opponent's treasure is {this.botTotalTeasure}.</p>
<div class="">
<button type="button" class="btn btn-success mr-md-2" name={item} id={item} onclick={playCard} each={item, i in allCards} show={this.playState==="startPlay"} >{item}</button>
</div>





<script>
let tag=this;
this.allCards=[1,2,3,4,5,6,7,8,9,10,11,12,13]
this.playState=""
this.btnCount=0
console.log(this.cardNumber)
this.gameId=this.parent.gameId;
console.log('meee',this.gameId);
this.userId=this.parent.userId;
console.log('meee',this.userId);
this.turns="1";
this.youTotalTeasure=0;
this.botTotalTeasure=0;
var userName=this.parent.parent.userName


startPlay(){
 console.log('this',event.target);
    this.playState="startPlay";
    observer.on('play:treasure',(treasure)=>{
     this.update()
 })


}



playCard(){
    this.cardNumber=event.target.name;
  console.log(this.cardNumber)
    fetch('http://treasure.chrisproctor.net/players/'+ this.userId +'/games/' +this.gameId + '/play/' + this.cardNumber).then(response => {
         return response.json();
     }).then(data => {
         console.log(data)
         console.log('playerName', Object.keys(data.players))
         if ((this.cardNumber==13 && data.turns[1].bot==1) || data.turns[1].bot>this.cardNumber){
             alert("robot plays" + data.turns[1].bot + "  Bot get "+ treasure + " ponits" )
             this.botTotalTeasure=data.players.bot.score;
         } else if ((this.cardNumber==1 && data.turns[1].bot==13)|| data.turns[1].bot<this.cardNumber){
             alert("robot plays" + data.turns[1].bot + "  You get "+treasure + " points")
             console.log('userName',data.players.cathy)
             this.youTotalTeasure=data.players[userName].score
         } else {
             alert("robot plays" + data.turns[1].bot + " you and bot play the same card")

         }

         treasure=data.turns[0].treasure;
         this.turns=data.turns.length;
         console.log('this.cardNumber',data.turns[1])

         // Work with JSON data here
         this.update();

         document.getElementById(this.cardNumber).style.color = "black";
		 alert("This button is disabled afterward.");
     });

}


</script>


<style>
.statebu{
 height:20px;
 width:80px;
}
</style>
</playBot>
