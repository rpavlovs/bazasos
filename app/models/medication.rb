class Medication < ActiveRecord::Base
  attr_accessible :person_id, :name, :med_type, :dose
  belongs_to :person
  validates_presence_of :person_id, :name
end
