class Person < ActiveRecord::Base
  attr_accessible :additional_details, :birth_date, :blood_type, :cell_num,
    :clinic_id, :family_name, :gender, :given_name, :middle_name, :rh_factor, :tax_num

  has_many :locations
  has_many :allergies
  has_many :medications

  def registration_location
    locations.registration.first
  end

  def residence_location
    locations.residence.first
  end
end
