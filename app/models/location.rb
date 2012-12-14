# == Schema Information
#
# Table name: locations
#
#  id               :integer          not null, primary key
#  description      :text
#  phone_num        :integer
#  city_name        :string(255)
#  street_name      :string(255)
#  street_num       :string(255)
#  building_num     :integer
#  entrance_num     :integer
#  floor_num        :integer
#  apartment_num    :integer
#  postal_code      :integer
#  address_commment :text
#  is_registration  :boolean
#  is_residence     :boolean
#  person_id        :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Location < ActiveRecord::Base
  attr_accessible :address_commment, :apartment_num, :building_num, :city_name, :description, :entrance_num, :floor_num, :is_registration, :is_residence, :person_id, :phone_num, :postal_code, :street_name, :street_num
  belongs_to :person
end
