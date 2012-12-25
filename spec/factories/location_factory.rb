# == Schema Information
#
# Table name: locations
#
#  id              :integer          not null, primary key
#  person_id       :integer
#  description     :string(255)
#  postal_code     :string(5)
#  region          :string(255)
#  city            :string(255)
#  street          :string(255)
#  street_number   :string(255)
#  building_number :integer
#  floor           :integer
#  entrance        :integer
#  appartment      :integer
#  phone_number    :string(10)
#  comment         :text
#  is_registration :boolean
#  is_residence    :boolean
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

FactoryGirl.define do
  factory :location do
    person { FactoryGirl.create(:person) }
    postal_code '01001'
    region 'Kyiv'
    city 'Kyiv'
    street 'Khreshatyk'
    sequence (:street_number) { |n| n.to_s }
    building_number 1
    floor 1
    entrance 1
    sequence(:appartment) { |n| n }

    description 'Resturant'
    phone_number '1234567890'
    comment 'Delicious meat & fish'

    is_registration false
    is_residence false

    trait :registration do
      is_registration true
    end

    trait :residence do
      is_residence true
    end
  end
end
