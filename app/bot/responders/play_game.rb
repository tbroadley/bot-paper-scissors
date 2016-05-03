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

      computer_preface = "I played #{computer_move_text} and "

      computer_responses = [
        "we tied.",
        "you won.",
        "I won."
      ]

      final_response = computer_preface + computer_responses[result]

      reexecute_with(text_response(final_response))
    end

  end
end
