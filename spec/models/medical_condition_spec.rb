# == Schema Information
#
# Table name: medical_conditions
#
#  id         :integer          not null, primary key
#  person_id  :integer
#  title      :string(255)
#  primary    :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe MedicalCondition do
  pending "add some examples to (or delete) #{__FILE__}"
end
