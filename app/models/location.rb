class Location < ActiveRecord::Base

attr_accessible :person_id, :description, :phone_num, :postal_code,
  :city, :street, :building, :appartment, :entrance_num, :floor_num,
  :comment, :is_registration, :is_residence

  belongs_to :person
end
