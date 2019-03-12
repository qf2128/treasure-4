<gameOver>

<h2 class="center">Game Over. {this.result}</h2>
<img class="center" src="./asset/{this.endImage}.jpg" alt="player" style="height:500px;width:500px;">

<script>
let tag=this

//observer.on('userScore',(userScore)=>{
//    this.userScore=userScore})
//observer.on('oppoScore',(oppoScore)=>{
//    this.oppoScore=oppoScore})
var userScore=this.parent.userTotalTeasure
var oppoScore=this.parent.oppoTotalTeasure
if (userScore>oppoScore){
    this.result="You Win!"
    this.endImage="piratewin"
} else{
    this.result="Sorry, you loose, want to try again?"
    this.endImage="sadpirate"
}

</script>

<style>

.center{
  margin-left: 27%
}
</style>

</gameOver>
