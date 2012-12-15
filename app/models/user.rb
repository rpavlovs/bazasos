# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  login           :string(255)
#  last_name       :string(255)
#  first_name      :string(255)
#  middle_name     :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  password_digest :string(255)
#

class User < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :login, :middle_name, :password, :password_confirmation
  has_secure_password

  before_save { self.login.downcase! }

  validates :login, presence:		true,
  									length:			{ maximum: 50, minimum: 5 },
  									uniqueness: { case_sensitive: false }
  validates :last_name, presence: true
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true
end
