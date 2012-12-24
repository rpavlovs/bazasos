FactoryGirl.define do
  factory :medication do
    person { FactoryGirl.create(:person) }
    name 'Aspirin'
    med_type 'something'
    dose '3 mg'
  end
end
