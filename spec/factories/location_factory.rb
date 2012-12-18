FactoryGirl.define do
  factory :location do
    person { FactoryGirl.create(:person) }
    postal_code '01001'
    region 'Kyiv'
    city 'Kyiv'
    sequence(:address) { |n| "Khreshatyk str., #{n}" }

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
