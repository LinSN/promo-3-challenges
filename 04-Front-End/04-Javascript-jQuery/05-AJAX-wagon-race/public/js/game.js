var GRID_SIZE = 30;
var PLAYER1_KEY = 68; // D
var PLAYER2_KEY = 76; // L
var game_id;
var session_id;
$(function(){
  $.get( "/session/create", function(data) { // session created
    console.log(data);
    session_id = data.id; //
  }); //

  $('form').hide();
  $('table').hide();
  $('#restart').hide();
  $('#submit2').click(function(){
    $('form').fadeIn();
  });


  $('#form').on('submit', function(event){
    var time_ini = event.timeStamp;
    event.preventDefault();
  //   var player1 = $('#player1').val(); // Keep player1 value
  //   var player2 = $('#player2').val(); // Keep player2 value

  //   var rowsNumber = $('#rows_number').val(); //Keep rowsNumber
    var player1 = $('#player1').val();
    var player2 = $('#player2').val();
    var rowsNumber = $('#rows_number').val();
    $('form').fadeOut(300);
    $('#submit2').fadeOut(300);
    $('table').delay(1000).fadeIn(300);



    var data_yo = JSON.stringify( {
        "players": [
          {'name': player1},
          {'name': player2}
        ]
      })
    $.post( '/session/' + session_id + '/game/create', data_yo,
      function(json) {
      var game_id = json.game.id;
      generate_grid(rowsNumber);
      give_player_hints(PLAYER1_KEY, PLAYER2_KEY);
        var player1id = json.game.players[0].id;
        var player2id = json.game.players[1].id;
        console.log(player1id);
        console.log(player2id);

        $(document).on('keyup', function(event) {
          // d = 68
          // l = 76
          if (event.which == PLAYER1_KEY) {
              update_player_position("player1", 1, player1id, game_id, time_ini);
          }
          if (event.which == PLAYER2_KEY) {
              update_player_position("player2", 1, player2id, game_id, time_ini);
          }
    });

  })
})
function update_player_position(player, number, playerid, game_id,time_ini) {
  var cases  = $('#' + player + '_race td'),
      length = cases.length,
      previous_position = cases.siblings('.active').index();

  cases.removeClass('active');
  cases.eq(previous_position + number).addClass('active');

  console.log(previous_position + number, length);
  if ((previous_position + number) >= length) {
    alert(player + ' has won !');

    var data = JSON.stringify({
      "winner": playerid,
      "elapsed_time": (new Date).getTime() - time_ini
    });

    $.post('/game/' + game_id + '/finish', data, function(json){
      console.log(json);
    });
    $.get('/game/' + game_id + '/results', function(data){
      console.log(data);
    })

    $('#restart').fadeIn(30).click(function(){
      reset();
      $(this).fadeOut();
    });

  }
}

})

function generate_grid(size) {
  for (var i = 0; i < size - 1; i++) {
    $('#player1_race').append('<td></td>');
    $('#player2_race').append('<td></td>');
  }
}

function give_player_hints(player1_key, player2_key) {
  $('#player1_hint').html('Player 1: Hit <strong>' + String.fromCharCode(player1_key) + '</strong>');
  $('#player2_hint').html('Player 2: Hit <strong>' + String.fromCharCode(player2_key) + '</strong>');
}

function reset() {
    $('.racer_table td').removeClass('active');
    $('#player1_race td:first-child').addClass('active');
    $('#player2_race td:first-child').addClass('active');
}
