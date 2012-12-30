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

  def self.search(query)
    if /^\d{10}$/ =~ query
      location_matches = Location.where(phone_number: query).pluck(:person_id).uniq
      condition = 'cell_num = ?'
      if location_matches.any?
        condition = "#{condition} or id in (#{location_matches.join(',')})"
      end
      where(condition, query)
    else
      words = query.split
      words.map! { |word| "#{word}%" }
      case words.count
      when 1
        where('family_name ilike ? or given_name ilike ? or middle_name ilike ?', words.first, words.first, words.first)
      when 2
        where('(family_name ilike ? and given_name ilike ?) or (given_name ilike ? and middle_name ilike ?)', words.first, words.second, words.first, words.second)
      when 3
        where('family_name ilike ? and given_name ilike ? and middle_name ilike ?', words.first, words.second, words.third)
      else
        []
      end
    end
  end
end
