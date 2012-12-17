class Location < ActiveRecord::Base

  attr_accessible :person, :person_id, :postal_code, :region, :city, :address,
    :description, :phone_number, :comment, :is_registration, :is_residence

  validates_length_of :postal_code, maximum: 5
  validates_length_of :phone_number, maximum: 20

  validates_format_of :phone_number, with: /[\d\+ -]+/
  validates_format_of :postal_code, with: /\d{5}/
  belongs_to :person

  scope :registration, where(is_registration: true)
  scope :residence, where(is_residence: true)
end
