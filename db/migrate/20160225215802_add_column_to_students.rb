class AddColumnToStudents < ActiveRecord::Migration
  def change
    add_column :students, :username, :string
    add_column :students, :password_digest, :string
    add_column :students, :role, :integer, default: 0
  end
end
