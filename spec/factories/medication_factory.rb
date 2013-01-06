# == Schema Information
#
# Table name: medications
#
#  id         :integer          not null, primary key
#  person_id  :integer
#  title      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
  factory :medication do
    person { FactoryGirl.create(:person) }
    sequence (:title) { |n| "medication_#{n}" }
  end
end
