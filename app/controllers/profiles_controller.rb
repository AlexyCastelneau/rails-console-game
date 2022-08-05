class ProfilesController < ApplicationController
  def show
    @current_user_characters = Perso.where("user_id = ?", current_user.id)
  end
end
