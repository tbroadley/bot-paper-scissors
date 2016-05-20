  module Responders
  class Default < ApplicationResponder
    respond_to "scan-data", "text", "link", "picture", "video", "sticker"

    def can_handle?
      true
    end

    def handle
      [
        text_response('That wasn\'t Rock, Paper, nor Scissors!'),
        text_response('What do you play?', ['Rock', 'Paper', 'Scissors'])
      ]
    end

  end
end
