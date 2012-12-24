require 'spec_helper'

describe EmergencyContact do
  it 'should validate attributes' do
    FactoryGirl.build(:emergency_contact).should be_valid
    FactoryGirl.build(:emergency_contact, priority: 0).should be_invalid
  end
end
