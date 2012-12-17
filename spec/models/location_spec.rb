require 'spec_helper'

describe Location do
  it 'should validate attributes' do
    FactoryGirl.build(:location).should be_valid

    FactoryGirl.build(:location, phone_number: '+380 123-45-67').should be_valid
    FactoryGirl.build(:location, phone_number: 'abcd').should be_invalid

    FactoryGirl.build(:location, postal_code: '0' * 5).should be_valid
    FactoryGirl.build(:location, postal_code: '1234z').should be_invalid

    FactoryGirl.build(:location, postal_code: '0' * 6).should be_invalid
    FactoryGirl.build(:location, phone_number: '0' * 21).should be_invalid
  end
end
