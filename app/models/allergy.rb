class Allergy < ActiveRecord::Base
  attr_accessible :person_id, :person, :allergen, :allergen_type, :reaction
  belongs_to :person
  validates_presence_of :person_id, :allergen
end
