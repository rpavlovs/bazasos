# == Schema Information
#
# Table name: emergency_contacts
#
#  id                :integer          not null, primary key
#  person_id         :integer
#  name              :string(255)
#  relationship_type :string(255)
#  phones            :string(255)
#  priority          :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

FactoryGirl.define do
  factory :emergency_contact do
    person { FactoryGirl.create(:person) }
    name 'Ivan Ivanovich'
    relationship_type 'son'
    phones '0441234567, 0447654321'
    priority 2
  end
end
