# == Schema Information
#
# Table name: people
#
#  id                 :integer          not null, primary key
#  family_name        :string(255)
#  given_name         :string(255)
#  middle_name        :string(255)
#  birth_date         :date
#  gender             :boolean
#  tax_num            :integer
#  cell_num           :integer
#  blood_type         :integer
#  rh_factor          :boolean
#  additional_details :text
#  clinic_id          :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

class Person < ActiveRecord::Base
  attr_accessible :additional_details, :birth_date, :blood_type, :cell_num, :clinic_id, :family_name, :gender, :given_name, :middle_name, :rh_factor, :tax_num
  has_many :locations
end
