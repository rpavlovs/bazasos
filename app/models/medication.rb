# == Schema Information
#
# Table name: medications
#
#  id         :integer          not null, primary key
#  person_id  :integer
#  name       :string(255)
#  med_type   :string(255)
#  dose       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Medication < ActiveRecord::Base
  attr_accessible :person_id, :person, :title
  belongs_to :person
  validates_presence_of :person_id, :title
end
