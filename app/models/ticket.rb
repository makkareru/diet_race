class Ticket < ActiveRecord::Base
  validates :name, presence: true
  validates :email, presence: true
  validates :player_1, presence: true
  validates :player_2, presence: true
  validates :number_of_set, presence: true
end
