FactoryGirl.define do
  factory :person do
    sequence(:family_name) { |n| "family_name_#{n}" }
    sequence(:given_name) { |n| "given_name_#{n}" }
    sequence(:middle_name) { |n| "middle_name_#{n}" }
    birth_date { (80 + rand(10)).years.ago }
  end
end