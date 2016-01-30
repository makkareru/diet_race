class Admin::PlayersController < Admin::BaseController
  def index
    @players = Player.all
  end

  def new
    @player = Player.new
  end

  def create
    @player = Player.new(player_params)
    unless @player.save
      render :new
    end
    redirect_to admin_players_path
  end

  def edit
    @player = Player.find(params[:id])
  end

  private

  def player_params
    params.require(:player).permit(:name,:weight,:profile,:ranking)
  end
end
