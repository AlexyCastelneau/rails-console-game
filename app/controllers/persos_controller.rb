class PersosController < ApplicationController
  def index
    @persos = Perso.where("user_id = ?", current_user.id)
  end

  def show
    @perso = Perso.find(params[:id])
  end

  def new
    @perso = Perso.new
  end

  def create
    @perso = Perso.new(perso_params)
    @perso.user = current_user
    @perso.time_played = 0.0
    @perso.save ? (redirect_to "#") : (render :new)
  end

  private

  def perso_params
    params.require(:perso).permit(:id, :pseudo)
  end
end
