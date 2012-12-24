FactoryGirl.define do
  factory :emergency_contact do
    person { FactoryGirl.create(:person) }
    name 'Ivan Ivanovich'
    relationship_type 'son'
    phones '0441234567, 0447654321'
    priority 2
  end
end
