class CreateMedications < ActiveRecord::Migration
  def change
    create_table :medications do |t|
      t.belongs_to :person
      t.string :title
      t.timestamps
    end
  end
end
