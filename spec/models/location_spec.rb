# encoding: utf-8
# == Schema Information
#
# Table name: locations
#
#  id              :integer          not null, primary key
#  person_id       :integer
#  description     :string(255)
#  postal_code     :string(5)
#  region          :string(255)
#  city            :string(255)
#  street          :string(255)
#  street_number   :string(255)
#  building_number :integer
#  floor           :integer
#  entrance        :integer
#  appartment      :integer
#  phone_number    :string(10)
#  comment         :text
#  is_registration :boolean
#  is_residence    :boolean
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'spec_helper'

describe Location do
  it 'should validate attributes' do
    FactoryGirl.build(:location).should be_valid

    FactoryGirl.build(:location, phone_number: '1234567890').should be_valid
    FactoryGirl.build(:location, phone_number: '123456789z').should be_invalid
    FactoryGirl.build(:location, phone_number: '123456789').should be_invalid

    FactoryGirl.build(:location, postal_code: '12345').should be_valid
    FactoryGirl.build(:location, postal_code: '1234z').should be_invalid
    FactoryGirl.build(:location, postal_code: '1234').should be_invalid

    FactoryGirl.build(:location, street_number: '1/1').should be_valid
    FactoryGirl.build(:location, street_number: '1а').should be_valid
    FactoryGirl.build(:location, street_number: '1/1а').should be_valid
    FactoryGirl.build(:location, street_number: '1б/1а').should be_valid
    FactoryGirl.build(:location, street_number: '1/').should be_invalid
    FactoryGirl.build(:location, street_number: 'б/1а').should be_invalid
    FactoryGirl.build(:location, street_number: '1б/а').should be_invalid
  end
end
