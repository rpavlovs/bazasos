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
#  tax_num            :string(10)
#  cell_num           :string(10)
#  blood_type         :integer
#  rh_factor          :boolean
#  additional_details :text
#  clinic_id          :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

FactoryGirl.define do
  factory :person do
    sequence(:family_name) { |n| "family_name_#{n}" }
    sequence(:given_name) { |n| "given_name_#{n}" }
    sequence(:middle_name) { |n| "middle_name_#{n}" }
    birth_date { (80 + rand(10)).years.ago }
    cell_num '1234567890'
    blood_type 1
    rh_factor true
    tax_num '123456'
    gender false
  end
end
