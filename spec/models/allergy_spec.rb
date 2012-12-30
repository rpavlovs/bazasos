# == Schema Information
#
# Table name: allergies
#
#  id            :integer          not null, primary key
#  person_id     :integer
#  allergen      :string(255)
#  allergen_type :string(255)
#  reaction      :string(255)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

require 'spec_helper'

describe Allergy do
  it 'should validate attributes' do
    FactoryGirl.build(:allergy).should be_valid
    FactoryGirl.build(:allergy, title: nil).should be_invalid
    FactoryGirl.build(:allergy, person: nil).should be_invalid
  end
end
