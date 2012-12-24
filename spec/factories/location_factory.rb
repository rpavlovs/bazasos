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
