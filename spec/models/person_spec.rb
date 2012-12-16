require 'spec_helper'

describe Person do
  subject { FactoryGirl.create(:person) }

  it 'should have registration location' do
    registration_location = Location.create(person: subject, is_registration: true)
    subject.registration_location.should == registration_location
  end

  it 'should have residence location' do
    residence_location = Location.create(person: subject, is_residence: true)
    subject.residence_location.should == residence_location
  end
end
