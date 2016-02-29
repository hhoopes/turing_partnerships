class AddAvatarToStudents < ActiveRecord::Migration
  def change
    add_attachment :students, :avatar
  end
end
