class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.belongs_to :person

      t.string :postal_code, limit: 5
      t.string :region
      t.string :city
      t.text :address

      t.string :description
      t.string :phone_number, limit: 20
      t.text :comment

      t.boolean :is_registration
      t.boolean :is_residence

      t.timestamps
    end
  end
end
