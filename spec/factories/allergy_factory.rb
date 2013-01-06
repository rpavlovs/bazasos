# == Schema Information
#
# Table name: allergies
#
#  id         :integer          not null, primary key
#  person_id  :integer
#  title      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
  factory :allergy do
    person { FactoryGirl.create(:person) }
    sequence (:title) { |n| "allergy_#{n}" }
  end
end
