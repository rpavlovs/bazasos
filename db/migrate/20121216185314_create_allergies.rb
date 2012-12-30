class CreateAllergies < ActiveRecord::Migration
  def change
    create_table :allergies do |t|
      t.belongs_to :person
      t.string :title
      t.timestamps
    end
  end
end
