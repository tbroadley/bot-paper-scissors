module Responders
  class PlayGame < ApplicationResponder
    respond_to "text"

    def can_handle?
      match_message(/(Rock)|(Paper)|(Scissors)/) && responses.empty?()
    end

    def handle
      MIXPANEL.track(user.username, 'Game Result')
      rps = ['Rock', 'Paper', 'Scissors']

      player_move = rps.index(message['body'])
      computer_move = rand(3)

      player_move_text = "You play #{message["body"]}."
      computer_move_text = "I play #{rps[computer_move]}#{player_move == computer_move ? " too" : ""}."

      result = (player_move - computer_move) % 3

      results_text = [
        "We tie!",
        "You win!",
        "I win!"
      ]

      if result == 1
        user.win_total += 1
      elsif result == 2
        user.loss_total += 1
      end
      user.save!

      winloss_record = " So far, your win-loss record is #{user.win_total}-#{user.loss_total}."

      reexecute_with([
        "#{player_move_text} #{computer_move_text} #{results_text[result]}",
        winloss_record
      ].map { |msg| text_response(msg) })
    end

  end
end
