class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :family_name
      t.string :given_name
      t.string :middle_name
      t.date :birth_date
      t.boolean :gender
      t.integer :tax_num
      t.integer :cell_num
      t.integer :blood_type
      t.boolean :rh_factor
      t.text :additional_details
      t.integer :clinic_id

      t.timestamps
    end
  end
end
