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

class Allergy < ActiveRecord::Base
  attr_accessible :person_id, :person, :title
  belongs_to :person
  validates_presence_of :person_id, :title
end
