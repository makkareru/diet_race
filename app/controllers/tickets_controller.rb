class TicketsController < ApplicationController
  def index
    @players = Player.all
    @total = calc_number_of_tickets.to_f
  end

  def new
    @ticket = Ticket.new
    @players = Player.all
  end

  def create
    @ticket = Ticket.new(ticket_params)
    unless @ticket.save
      render :new
    else
      redirect_to root_path
    end
  end

  def calc_number_of_tickets
    sum = 0
    Ticket.all.each do |t|
      sum = sum + t.number_of_set
    end
    sum
  end

  private

  def ticket_params
    params.require(:ticket).
      permit(:name,:email,:player_1,:player_2,:number_of_set)
  end
end
