class TicketsController < ApplicationController
  def index
    @players = Player.all
  end

  def new
    @ticket = Ticket.new
  end

  def create
    @ticket = Ticket.new(ticket_params)
    unless @ticket.save
      render :new
    else
      redirect_to root_path
    end
  end

  private

  def ticket_params
    params.require(:ticket).
      permit(:name,:email,:player_1,:player_2,:number_of_set)
  end
end
