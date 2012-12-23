class EmergencyContact < ActiveRecord::Base
  attr_accessible :person_id, :person, :name, :relationship_type, :phones, :priority
  belongs_to :person
  validates_presence_of :person_id, :name, :relationship_type, :phones, :priority
  validates_inclusion_of :priority, in: (1..3)
end
