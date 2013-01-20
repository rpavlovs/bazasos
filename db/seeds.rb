# encoding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

###############################################################################
# Ахметова Някия Насрединовна
###############################################################################
akhmetova = Person.create(
	family_name: 				'Ахметова',
	given_name: 				'Някия',
	middle_name: 				'Насрединовна',
	birth_date: 				'1968-12-12',
	gender: 						'false',
	tax_num: 						'2323423423',
	cell_num: 					'0931897680',
	blood_type: 				'4',
	rh_factor: 					'true',
	additional_details: 'Пробная бабушка',
	clinic_id: 					''
)

# Прописка
Location.create(
	person_id: 					akhmetova.id,
	description: 				'прописка #неОтображать#',
	postal_code: 				'03067',
	region: 						'Киевская',
	city: 							'Киев',
	street:							'Днестровская',
	street_number:			'19',
	building_number:		'',
	entrance: 					'1',
	floor: 							'2',
	appartment: 	 			'7',
	phone_number:				'0444531530',
	comment:						'',
	is_registration: 		'true',
	is_residence:				'false'
)

# Проживание
Location.create(
	person_id: 					akhmetova.id,
	description: 				'Адрес проживания #неОтображать# #выделять ',
	postal_code: 				'04053',
	region: 						'Киевская',
	city: 							'Киев',
	street:							'Гоголевская',
	street_number:			'42а',
	building_number:		'',
	entrance: 					'1',
	floor: 							'5',
	appartment: 	 			'32',
	phone_number:				'0444860630',
	comment:						'Код парадного 450, ключи у соседей в квартирах 31 и 33',
	is_registration: 		'false',
	is_residence:				'true'
)

# Дача
Location.create(
	person_id: 					akhmetova.id,
	description: 				'Дача',
	postal_code: 				'',
	region: 						'Киевская',
	city: 							'Киев',
	street:							'Русановские сады',
	street_number:			'164',
	building_number:		'',
	entrance: 					'',
	floor: 							'',
	appartment: 	 			'',
	phone_number:				'0444860630',
	comment:						'25я садовая',
	is_registration: 		'false',
	is_residence:				'false'
)
Medication.create(
	person_id: 					akhmetova.id,
	title:       				'Инсулин',
)

EmergencyContact.create(
	person_id:         	akhmetova.id,
	name:              	'Ахметов, Ринат Леонидович',
	relationship_type: 	'Сын',
	phones:            	'0931112222',
	priority:          	'3'
)
User.create(
  login: 'admin',
  password: 'admin1',
  password_confirmation: 'admin1',
  family_name: 'admin'
)
