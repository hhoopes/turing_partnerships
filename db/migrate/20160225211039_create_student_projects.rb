class CreateStudentProjects < ActiveRecord::Migration
  def change
    create_table :my_projects do |t|
      t.references :project, index: true, foreign_key: true
      t.references :student, index: true, foreign_key: true
      t.references :partnership, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
