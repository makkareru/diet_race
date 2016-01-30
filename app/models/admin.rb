class Admin < ActiveRecord::Base
  attr_accessor :password
  before_validation :encrypt_to_password
  after_save :clear_password

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :encrypted_password, presence: true
  validates :salt, presence: true


  def match_password password
    encrypted_password == Digest::SHA1.hexdigest(password)
  end

  private

  def encrypt_to_password
    self.salt = Digest::SHA1.hexdigest("#{self.email}-#{Time.now}-#{Random.new}")
    self.encrypted_password = Digest::SHA1.hexdigest(self.password)
  end

  def after_save
    self.password = nil
  end
end
