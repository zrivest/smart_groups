class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.string :assignment_name
      t.date :start_date
      t.date :due_date
      t.integer :course_id

      t.timestamps
    end
  end
end
