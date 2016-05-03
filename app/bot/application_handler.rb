class ApplicationHandler < Bot::Handler
  use Responders::PlayGame
  use Responders::StartGame
  use Responders::Default

  # def user_for(message)
  #   User.find_or_create_by(username: message["from"])
  # end
end
