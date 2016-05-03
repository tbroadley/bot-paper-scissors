module Responders
  class Introduction < ApplicationResponder
    respond_to "start-chatting", "text"

    def can_handle?
      responses.empty?() ? message["type"] == "start-chatting" : responses[0]["body"] == "Resetting..."
    end

    def handle
      reexecute_with(text_response("Hi, I'm Bot Paper Scissors. Play RPS with me!"))
    end

  end
end
