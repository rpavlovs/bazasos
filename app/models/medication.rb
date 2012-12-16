class Medication < ActiveRecord::Base
  attr_accessible :name, :type, :dose
  belongs_to :person
  validates_presence_of :person_id, :name
end
