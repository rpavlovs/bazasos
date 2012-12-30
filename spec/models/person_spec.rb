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

  context 'search' do
    let!(:another_person) { FactoryGirl.create(:person, cell_num: '7539842678') }
    let!(:location) { FactoryGirl.create(:location, person: subject, phone_number: '2369521457') }
    let!(:another_location) { FactoryGirl.create(:location, person: another_person, phone_number: '8625742358') }

    it 'should search by cell number' do
      Person.search(subject.cell_num).should == [subject]
    end

    it 'should search by any name' do
      Person.search(subject.family_name).should == [subject]
      Person.search(subject.given_name).should == [subject]
      Person.search(subject.middle_name).should == [subject]
    end

    it 'should search by family and given or by given and middle' do
      Person.search("#{subject.family_name} #{subject.given_name}").should == [subject]
      Person.search("#{subject.given_name} #{subject.middle_name}").should == [subject]
    end

    it 'should search by full name' do
      Person.search("#{subject.family_name} #{subject.given_name} #{subject.middle_name}").should == [subject]
    end

    it 'should search by location phone' do
      Person.search(location.phone_number).should == [subject]
    end
  end
end
