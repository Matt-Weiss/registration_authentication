class User < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :email
  validates_presence_of :password
  validates_uniqueness_of :email

  def self.authenticate(email, password)
    self.where(["email = ? and password = ?", email, password])
  end

end
