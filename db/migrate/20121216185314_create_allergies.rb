class CreateAllergies < ActiveRecord::Migration
  def change
    create_table :allergies do |t|
      t.belongs_to :person
      t.string :allergen
      t.string :allergyn_type
      t.string :reaction
      t.timestamps
    end
  end
end
