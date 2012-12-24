class CreateEmergencyContacts < ActiveRecord::Migration
  def change
    create_table :emergency_contacts do |t|
      t.belongs_to :person
      t.string :name
      t.string :relationship_type
      t.string :phones
      t.integer :priority
      t.timestamps
    end
  end
end
