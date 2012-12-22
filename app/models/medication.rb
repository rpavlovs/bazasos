class Medication < ActiveRecord::Base
  attr_accessible :person_id, :person, :name, :med_type, :dose
  belongs_to :person
  validates_presence_of :person_id, :name
end
