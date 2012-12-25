# == Schema Information
#
# Table name: emergency_contacts
#
#  id                :integer          not null, primary key
#  person_id         :integer
#  name              :string(255)
#  relationship_type :string(255)
#  phones            :string(255)
#  priority          :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

require 'spec_helper'

describe EmergencyContact do
  it 'should validate attributes' do
    FactoryGirl.build(:emergency_contact).should be_valid
    FactoryGirl.build(:emergency_contact, priority: 0).should be_invalid
  end
end
