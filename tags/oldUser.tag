<oldUser>
 <div hide={this.stats} class="containter">
 <div class= "center">
   <h1> Ahoy there  {this.userName} !</h1>
 </div>

 <div class="row">
   <div class="left">
    <input type="text" class="userId" value="" placeholder="input your User ID" ref="userId">
   </div>
   <div class="right">
    <button type="button" class="btn btn-primary" onclick="{getChrisDataOldId}">SUBMIT</button>
 </div>
   <p if={this.stats}> History record: win-{this.stats.wins} lose-{this.stats.losses} <br> games waiting: {this.gameWait}</p>
 </div>
</div>
 <game if={this.stats}></game>

<script>
let tag=this;
console.log(this);


getChrisDataOldId(){
    var userId=this.refs.userId.value;
    console.log(userId)
    fetch('http://treasure.chrisproctor.net/players/' + userId).then(response => {
			return response.json();
		}).then(data => {
			// Work with JSON data here
			this.userName = data.name;
            var userName=this.userName;
            observer.trigger('userName',userName)
            this.stats=data.stats;
            var stats=this.stats;
            observer.trigger('stats', stats)
            this.gameWait=(data.games_waiting).length
			console.log('new',data);
			this.update();
            observer.trigger('userId',userId)
console.log(this.stats)
		});
}

</script>

<style>

:scope{}
.userId{
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
</style>
</oldUser>
