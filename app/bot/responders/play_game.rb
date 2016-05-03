module Responders
  class PlayGame < ApplicationResponder
    respond_to "text"

    def can_handle?
      match_message(/(Rock)|(Paper)|(Scissors)/) && responses.empty?()
    end

    def handle
      rps = ['Rock', 'Paper', 'Scissors']

      player_move = rps.index(message['body'])
      computer_move = rand(3)
      computer_move_text = rps[computer_move]

      result = (player_move - computer_move) % 3

      computer_responses = [
        "I played #{computer_move_text} and we tied.",
        "I played #{computer_move_text} and you won.",
        "I played #{computer_move_text} and I won."
      ]

      reexecute_with(text_response(computer_responses[result]))
    end

  end
end
