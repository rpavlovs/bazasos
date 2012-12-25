# == Schema Information
#
# Table name: allergies
#
#  id            :integer          not null, primary key
#  person_id     :integer
#  allergen      :string(255)
#  allergen_type :string(255)
#  reaction      :string(255)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

FactoryGirl.define do
  factory :allergy do
    person { FactoryGirl.create(:person) }
    allergen 'Peanut'
    allergen_type 'food'
    reaction 'itching'
  end
end
