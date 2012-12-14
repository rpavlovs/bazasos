# encoding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

abdula = Person.create(
	family_name: 'Абдулова',
	given_name: 'Абдула',
	middle_name: 'Абдуловна',
	birth_date: '1968-12-12',
	gender: 'false',
	tax_num: '2323423423',
	cell_num: '380931897680',
	blood_type: '4',
	rh_factor: 'true',
	clinic_id: '',
	additional_details: 'Пробная бабушка'
)

Location.create(
	description: 'домашний + прописка // не отображать',
	phone_num:	'380444860630',
	city_name:	'Киев',
	street_name:	'Гоголевская',
	street_num:	'42а',
	building_num:	'',
	entrance_num:	'1',
	floor_num: '5',
	apartment_num: '32',
	postal_code:'04053',
	address_commment:	'Код парадного 450, ключи у соседей в квартирах 31 и 33',
	is_registration: 'true',
	is_residence:	'true',
	person_id: abdula.id
)