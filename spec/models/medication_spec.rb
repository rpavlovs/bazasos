require 'spec_helper'

describe Medication do
  it 'should validate attributes' do
    FactoryGirl.build(:medication).should be_valid
    FactoryGirl.build(:medication, name: nil).should be_invalid
    FactoryGirl.build(:medication, person: nil).should be_invalid
  end
end
