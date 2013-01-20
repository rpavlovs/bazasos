# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :medical_condition do
    person { FactoryGirl.create(:person) }
    title 'condition'
    is_primary false
  end
end
