FactoryGirl.define do
  factory :user do
    sequence(:login) { |n| "user-#{n}" }
    password 'password'
    given_name 'given'
    family_name 'family'
    middle_name 'middle'
    admin false

    trait :admin do
      admin true
    end
  end
end
