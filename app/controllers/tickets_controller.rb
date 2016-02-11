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
    @players = Player.all
    unless @ticket.save
      flash[:message] = "入力エラーがあります！ご確認ください"
      render :new
    else
      flash[:message] = "送信しました！応援ありがとうございます！"
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
      permit(:name,:email,:player_1,:player_2,:number_of_set,:ticket_type)
  end
end
