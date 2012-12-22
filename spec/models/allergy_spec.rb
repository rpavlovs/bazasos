require 'spec_helper'

describe Allergy do
  it 'should validate attributes' do
    FactoryGirl.build(:allergy).should be_valid
    FactoryGirl.build(:allergy, allergen: nil).should be_invalid
    FactoryGirl.build(:allergy, person: nil).should be_invalid
  end
end
