require 'spec_helper'

describe Person do
  subject { FactoryGirl.create(:person) }

  it 'should have registration location' do
    registration_location = FactoryGirl.create(:location, :registration, person: subject)
    subject.registration_location.should == registration_location
  end

  it 'should have residence location' do
    residence_location = FactoryGirl.create(:location, :residence, person: subject)
    subject.residence_location.should == residence_location
  end
end
