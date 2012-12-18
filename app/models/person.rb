# encoding: utf-8
class Person < ActiveRecord::Base
  attr_accessible :additional_details, :birth_date, :blood_type, :cell_num,
    :clinic_id, :family_name, :gender, :given_name, :middle_name, :rh_factor, :tax_num

  has_many :locations, dependent: :destroy
  has_many :allergies, dependent: :destroy
  has_many :medications, dependent: :destroy

  validates_format_of :cell_num, with: /\d{10}/

  def registration_location
    locations.registration.first
  end

  def residence_location
    locations.residence.first
  end

  def full_name
    [family_name, given_name, middle_name].compact.join(' ')
  end

  def gender_text
    gender ? 'Мужской' : 'Женский'
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
