module Responders
  class Introduction < ApplicationResponder
    respond_to "start-chatting", "text"

    def can_handle?
      responses.empty?() ? message["type"] == "start-chatting" : responses[0]["body"] == "Resetting..."
    end

    def handle
      MIXPANEL.track(user.username, 'Introduced')
      reexecute_with(text_response("Hi, I'm Bot Paper Scissors. Let's play Rock Paper Scissors!"))
    end

  end
end
