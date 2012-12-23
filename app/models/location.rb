# encoding: utf-8
class Location < ActiveRecord::Base
  default_scope order('is_residence desc')

  attr_accessible :person, :person_id, :postal_code, :region, :city, :street, :street_number,
    :building_number, :floor, :entrance, :appartment, :description, :phone_number,
    :comment, :is_registration, :is_residence

  validates_presence_of :description, :city, :street, :street_number

  validates_format_of :phone_number, with: /\d{10}/, allow_blank: true
  validates_format_of :postal_code, with: /\d{5}/, allow_blank: true
  validates_format_of :street_number, with: /^\d+[а-я]?(\/\d+[а-я]?)?$/

  belongs_to :person

  scope :registration, where(is_registration: true)
  scope :residence, where(is_residence: true)
end
