# encoding: utf-8
# == Schema Information
#
# Table name: people
#
#  id                 :integer          not null, primary key
#  family_name        :string(255)
#  given_name         :string(255)
#  middle_name        :string(255)
#  birth_date         :date
#  gender             :boolean
#  tax_num            :string(10)
#  cell_num           :string(10)
#  blood_type         :integer
#  rh_factor          :boolean
#  additional_details :text
#  clinic_id          :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

class Person < ActiveRecord::Base
  attr_accessible :additional_details, :birth_date, :blood_type, :cell_num,
    :clinic_id, :family_name, :gender, :given_name, :middle_name, :rh_factor, :tax_num

  has_many :locations, dependent: :destroy
  has_many :allergies, dependent: :destroy
  has_many :medications, dependent: :destroy
  has_many :emergency_contacts, dependent: :destroy

  validates_format_of :cell_num, with: /\d{10}/
  validates_format_of :tax_num, with: /\d{10}/
  validates_presence_of :family_name, :given_name, :middle_name, :birth_date, :tax_num, :cell_num, :blood_type
  validates_inclusion_of :rh_factor, in: [true, false]
  validates_inclusion_of :gender, in: [true, false]

  def registration_location
    locations.registration.first
  end

  def residence_location
    locations.residence.first
  end

  def full_name
    [family_name, given_name, middle_name].compact.join(' ')
  end

  def phone_numbers
    ([cell_num] + locations.pluck(:phone_number)).delete_if(&:blank?)
  end

  def age
    return nil unless self.birth_date
    today = Date.today
    result = today.year - birth_date.year
    result -= 1 if today.month < birth_date.month || (today.month == birth_date.month && today.mday < birth_date.mday)
    result
  end

  def self.search(search_object)
    result = scoped
    result = result.where('family_name ilike ?', "#{search_object.family_name}%")
    result = result.where('given_name ilike ?', "#{search_object.given_name}%")
    result = result.where('middle_name ilike ?', "#{search_object.middle_name}%")
    if search_object.phone_number.present?
      locations = Location.where(phone_number: search_object.phone_number)
      result = result.where(arel_table[:cell_num].eq(search_object.phone_number).or(arel_table[:id].in(locations.pluck(:id))))
    end
    result
  end

  def alerts
    result = []
    if registration_location.nil?
      result << 'Не указан адрес прописки'
    end
    if residence_location.nil?
      result << 'Не указан адрес проживания'
    end
    result
  end
end
