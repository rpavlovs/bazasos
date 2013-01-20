class CreateMedicalConditions < ActiveRecord::Migration
  def change
    create_table :medical_conditions do |t|
      t.integer :person_id
      t.string :title
      t.boolean :is_primary

      t.timestamps
    end
  end
end
