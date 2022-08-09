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
    # lignes 18-21 à sortir car impossible de mettre les items dans l'inventaire vu que le perso n'a pas d'id
    @perso.set_base_stats # mettre la race en argument quand elles y seront (et ajuster dans le model)
    @perso.set_gear # mettre la classe en argument quand elles y seront (et ajuster dans le model)
    @perso.set_geared_stats
    @perso.set_current_stats
    @perso.time_played = 0.0
    @perso.save ? (redirect_to "#") : (render :new)
  end

  private

  def perso_params
    params.require(:perso).permit(:id, :pseudo)
  end
end
