class Location < ActiveRecord::Base
  attr_accessible :address_commment, :apartment_num, :building_num, :city_name, :description, :entrance_num, :floor_num, :is_registration, :is_residence, :person_id, :phone_num, :postal_code, :street_name, :street_num
  belongs_to :person
end
