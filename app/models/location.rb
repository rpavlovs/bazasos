class Location < ActiveRecord::Base

attr_accessible :person, :person_id, :description, :phone_num, :postal_code,
  :city, :street, :building, :appartment, :entrance_num, :floor_num,
  :comment, :is_registration, :is_residence

  belongs_to :person
  scope :registration, where(is_registration: true)
  scope :residence, where(is_residence: true)

  def label
    [city, postal_code, street, building, appartment].compact.join(', ')
  end
end
