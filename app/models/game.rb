class Game
  def initialize(attributes)
    @perso_id = attributes[:perso].id
    @user_id = attributes[:current_user].id
    @session_start = Time.now
  end
end
