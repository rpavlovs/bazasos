# == Schema Information
#
# Table name: medications
#
#  id         :integer          not null, primary key
#  person_id  :integer
#  title      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe Medication do
  it 'should validate attributes' do
    FactoryGirl.build(:medication).should be_valid
    FactoryGirl.build(:medication, title: nil).should be_invalid
    FactoryGirl.build(:medication, person: nil).should be_invalid
  end
end
