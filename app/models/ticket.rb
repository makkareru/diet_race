class Ticket < ActiveRecord::Base
  validates :name, presence: true
  validates :email, presence: true
  validates :player_1, presence: true
  validates :player_2, presence: true, if: :type_streak?
  validates :number_of_set, presence: true, numericality: { greater_than: 0 }
  validates :ticket_type, presence: true
  validate :no_equal_player

  after_save :send_thanks_message

  enum ticket_type: {short: 0 ,double: 1}

  def no_equal_player
    if player_1 == player_2
      errors.add(:player_1, "は異なる選手を選択してください。")
      errors.add(:player_2, "は異なる選手を選択してください。")
    end
  end

  def send_thanks_message
    Message.regist(self).deliver_now
  end

  def type_streak?
    p self.ticket_type == 1
    self.ticket_type == 1
  end
end
