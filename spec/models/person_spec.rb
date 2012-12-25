# == Schema Information
#
# Table name: people
#
#  id                 :integer          not null, primary key
#  family_name        :string(255)
#  given_name         :string(255)
#  middle_name        :string(255)
#  birth_date         :date
#  gender             :boolean
#  tax_num            :string(10)
#  cell_num           :string(10)
#  blood_type         :integer
#  rh_factor          :boolean
#  additional_details :text
#  clinic_id          :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

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

  it 'should destroy dependent objects on removal' do
    location_id = FactoryGirl.create(:location, person: subject).id
    Location.find_by_id(location_id).should_not be_nil
    subject.destroy
    Location.find_by_id(location_id).should be_nil
  end
end
