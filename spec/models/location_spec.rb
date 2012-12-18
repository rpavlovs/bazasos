require 'spec_helper'

describe Location do
  it 'should validate attributes' dp
    FactoryGirl.build(:location).should be_valid

    FactoryGirl.build(:location, phone_number: '1234567890').should be_valid
    FactoryGirl.build(:location, phone_number: '123456789z').should be_invalid
    FactoryGirl.build(:location, phone_number: '123456789').should be_invalid

    FactoryGirl.build(:location, postal_code: '12345').should be_valid
    FactoryGirl.build(:location, postal_code: '1234z').should be_invalid
    FactoryGirl.build(:location, postal_code: '1234').should be_invalid
  end
end
