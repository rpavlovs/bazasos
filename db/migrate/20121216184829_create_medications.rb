class CreateMedications < ActiveRecord::Migration
  def change
    create_table :medications do |t|
      t.belongs_to :person
      t.string :name
      t.string :type
      t.string :dose
      t.timestamps
    end
  end
end
