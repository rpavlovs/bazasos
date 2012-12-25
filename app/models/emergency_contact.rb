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

class EmergencyContact < ActiveRecord::Base
  attr_accessible :person_id, :person, :name, :relationship_type, :phones, :priority
  belongs_to :person
  validates_presence_of :person_id, :name, :relationship_type, :phones, :priority
  validates_inclusion_of :priority, in: (1..3)
  default_scope order('priority desc')
end
