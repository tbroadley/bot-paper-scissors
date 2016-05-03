module Responders
  class StartGame < ApplicationResponder
    respond_to "text"

    def can_handle?
      true
    end

    def handle
      text_response('What do you play?', ['Rock', 'Paper', 'Scissors'])
    end

  end
end
