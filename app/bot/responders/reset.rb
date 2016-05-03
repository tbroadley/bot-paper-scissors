module Responders
  class Reset < ApplicationResponder
    def can_handle?
      match_message("Reset!") && responses.empty?()
    end

    def handle
      user.destroy!
      reexecute_with(text_response("Resetting..."))
    end

  end
end
