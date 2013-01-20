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

class MedicalCondition < ActiveRecord::Base
  belongs_to :person
  attr_accessible :person_id, :is_primary, :title, :person
  validates_presence_of :person_id, :title

  default_scope order('is_primary desc')

  def self.primary
    where(is_primary: true).first
  end
end
