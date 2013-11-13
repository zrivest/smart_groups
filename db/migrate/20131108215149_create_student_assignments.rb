class CreateStudentAssignments < ActiveRecord::Migration
  def change
    create_table :student_assignments do |t|
      t.integer :student_id
      t.integer :assignment_id
      t.integer :pod_id
      t.integer :grade
      t.integer :pod_id
      t.date :submit_date
      t.timestamps
    end
  end
end
