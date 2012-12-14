class Person < ActiveRecord::Base
  attr_accessible :additional_details, :birth_date, :blood_type, :cell_num, :clinic_id, :family_name, :gender, :given_name, :middle_name, :rh_factor, :tax_num
  has_many :locations
end
