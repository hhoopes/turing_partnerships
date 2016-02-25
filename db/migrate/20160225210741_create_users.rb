class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :password_digest
      t.integer :role
      t.references :student, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
