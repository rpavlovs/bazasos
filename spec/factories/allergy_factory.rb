FactoryGirl.define do
  factory :allergy do
    person { FactoryGirl.create(:person) }
    allergen 'Peanut'
    allergen_type 'food'
    reaction 'itching'
  end
end