# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  login           :string(255)
#  family_name     :string(255)
#  given_name      :string(255)
#  middle_name     :string(255)
#  password_digest :string(255)
#  admin           :boolean          default(FALSE)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ActiveRecord::Base
  attr_accessible :family_name, :given_name, :middle_name, :login, :password, :password_confirmation, :admin
  has_secure_password

  before_save { self.login.downcase! }

  validates :login, presence:		true,
  									length:			{ maximum: 50, minimum: 5 },
  									uniqueness: { case_sensitive: false }
  validates :family_name, presence: true
  validates :password, presence: true, confirmation: true, length: { within: 6..40 }, on: :create
  validates :password, confirmation: true, length: { :within => 6..40 }, on: :update, unless: lambda{ |user| user.password.blank? }

  def self.authenticate(credentials)
    find_by_login(credentials.login).try(:authenticate, credentials.password)
  end
end
