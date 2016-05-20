module Responders
  class StartGame < ApplicationResponder
    respond_to "text", "start-chatting"

    def can_handle?
      true
    end

    def handle
      MIXPANEL.track(user.username, 'Game Started')
      text_response('What do you play?', ['Rock', 'Paper', 'Scissors'])
    end

  end
end
