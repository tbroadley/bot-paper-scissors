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

      if result == 1
        user.win_total += 1
      elsif result == 2
        user.loss_total += 1
      end

      user.save!

      win_record = case user.win_total
      when 0
        "never won"
      when 1
        "won once"
      when 2
        "won twice"
      else
        "won #{user.win_total} times"
      end

      loss_record = case user.loss_total
      when 0
        "never lost"
      when 1
        "lost once"
      when 2
        "lost twice"
      else
        "lost #{user.loss_total} times"
      end

      winloss_record = " So far, you have #{win_record} and #{loss_record}."

      final_response = computer_preface + computer_responses[result] + winloss_record

      reexecute_with(text_response(final_response))
    end

  end
end
