FactoryGirl.define do
  factory :allergy do
    person { FactoryGirl.create(:person) }
    allergen 'Peanut'
    type 'food'
    reaction 'itching'
  end
end
