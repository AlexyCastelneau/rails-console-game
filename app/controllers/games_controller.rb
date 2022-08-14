class GamesController < ApplicationController
  def run
    if current_user.game_running
      # alert
      raise
    else
      current_user.game_running = true #dunno why it doesn't work
      redirect_to play_path(perso: params[:perso])
    end
  end

  def play
    @perso = Perso.find(params[:perso])
    @game = Game.new({ perso: @perso, user: current_user })
    # current_user.game = game # => btn load last game sur le menu

    if Inventory.where("perso_id = ?", @perso.id) == []
      @perso.set_base_stats # mettre la race en argument quand elles y seront (et ajuster dans le model)
      @perso.set_gear # mettre la classe en argument quand elles y seront (et ajuster dans le model)
      @perso.set_geared_stats
      @perso.set_current_stats
    end
  end
end
