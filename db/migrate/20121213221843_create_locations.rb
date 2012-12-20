class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.belongs_to :person
      t.string :description

      t.string :postal_code, limit: 5
      t.string :region
      t.string :city
      t.string :street
      t.string :street_number
      t.integer :building_number
      t.integer :floor
      t.integer :entrance
      t.integer :appartment

      t.string :phone_number, limit: 20
      t.text :comment

      t.boolean :is_registration
      t.boolean :is_residence

      t.timestamps
    end
  end
end
