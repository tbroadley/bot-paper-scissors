module Responders
  class Introduction < ApplicationResponder
    respond_to "start-chatting"

    def can_handle?
      responses.empty?()
    end

    def handle
      reexecute_with(text_response("Hi, I'm Bot Paper Scissors. Play RPS with me!"))
    end

  end
end
