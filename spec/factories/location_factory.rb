FactoryGirl.define do
  factory :location do
    person { FactoryGirl.create(:person) }
    postal_code '01001'
    region 'Kyiv'
    city 'Kyiv'
    sequence(:address) { |n| "Khreshatyk str., #{n}" }

    description "Resturant"
    sequence(:phone_number) { |n| n.to_s }
    comment "Delicious meat & fish"

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