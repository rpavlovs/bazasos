# encoding: utf-8
# == Schema Information
#
# Table name: locations
#
#  id              :integer          not null, primary key
#  person_id       :integer
#  description     :string(255)
#  postal_code     :string(5)
#  region          :string(255)
#  city            :string(255)
#  street          :string(255)
#  street_number   :string(255)
#  building_number :integer
#  floor           :integer
#  entrance        :integer
#  appartment      :integer
#  phone_number    :string(10)
#  comment         :text
#  is_registration :boolean
#  is_residence    :boolean
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

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
