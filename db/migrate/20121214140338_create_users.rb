class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :login
      t.string :family_name
      t.string :given_name
      t.string :middle_name
      t.string :password_digest
      t.boolean :admin, default: false

      t.timestamps
    end
    add_index :users, :login, unique: true
  end
end
