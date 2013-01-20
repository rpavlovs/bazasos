# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :medical_condition do
    person { FactoryGirl.create(:person) }
    title 'condition'
    primary false
  end
end
