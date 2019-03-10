<playFriend>
    <div class="">
      <p>Get ready to play with your friend!</p>
      <button type="button" name="button" class="btn btn-primary" onclick={startGame}>Start game</button>
    </div>



<play if={this.state==="readyWithFriends"}></play>


    <script>
startGame(){
    this.state="readyWithFriends"
}

    </script>
</playFriend>
