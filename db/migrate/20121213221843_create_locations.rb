class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.belongs_to :person

      t.string :description
      t.integer :phone_num

      t.integer :postal_code
      t.string :city
      t.string :street
      t.integer :building
      t.integer :appartment

      t.integer :entrance_num
      t.integer :floor_num

      t.text :comment

      t.boolean :is_registration
      t.boolean :is_residence

      t.timestamps
    end
  end
end
