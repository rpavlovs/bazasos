class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.text :description
      t.integer :phone_num
      t.string :city_name
      t.string :street_name
      t.string :street_num
      t.integer :building_num
      t.integer :entrance_num
      t.integer :floor_num
      t.integer :apartment_num
      t.integer :postal_code
      t.text :address_commment
      t.boolean :is_registration
      t.boolean :is_residence
      t.integer :person_id

      t.timestamps
    end
  end
end
