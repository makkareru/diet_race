class TopController < ApplicationController
  def index
    @ticket = Ticket.new
    @players = Player.all
  end
end
