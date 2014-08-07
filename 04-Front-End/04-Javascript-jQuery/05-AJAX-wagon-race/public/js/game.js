var GRID_SIZE = 30;
var PLAYER1_KEY = 68; // D
var PLAYER2_KEY = 76; // L

$(function() {
  var session;

  $.get( "http://localhost:4567/session/create", function(event) {
    $('#start-button').removeAttr('hidden');
    session = event;
  });

  $('#start-button').click(function() {
    $('#form-name').removeAttr('hidden');
  });

  $('#form-name').on('submit',function(e) {
    e.preventDefault();
    console.log(e);
    var p1 = $("#player1-name").val();
    var p2 = $("#player2-name").val();

    var data = JSON.stringify({
                players: [
                  { name: p1},
                  { name: p2 }
                ]
              });

    $.post( "http://localhost:4567/session/" + session.id + "/game/create", data, function(argument) {

      console.log(argument.players);

      $('#start-button').attr("hidden","true")
      $('#form-name').attr("hidden","true")

      generate_grid(GRID_SIZE);
      give_player_hints(PLAYER1_KEY, PLAYER2_KEY);

      $(document).on('keyup', function(event) {

        // d = 68
        // l = 76
        if (event.which == PLAYER1_KEY) {
            update_player_position("player1", 1, p1);
        }
        if (event.which == PLAYER2_KEY) {
            update_player_position("player2", 1, p2);
        }
      });
    });

  });

});












function update_player_position(player, number, playername) {
    var cases  = $('#' + player + '_race td'),
        length = cases.length,
        previous_position = cases.siblings('.active').index();

    cases.removeClass('active');
    cases.eq(previous_position + number).addClass('active');

    console.log(previous_position + number, length);
    if ((previous_position + number) >= length) {
        alert(playername + ' has won !');
        reset();
    }
}

function generate_grid(size) {
  $('body').append('<table class="racer_table"><tr id="player1_race"><td class="active"></td></tr> <tr id="player2_race"><td class="active"></td></tr></table>')
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
