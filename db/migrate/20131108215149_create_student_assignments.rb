class CreateStudentAssignments < ActiveRecord::Migration
  def change
    create_table :student_assignments do |t|
      t.integer :student_id
      t.integer :assignment_id
      t.integer :pod_id
      t.integer :grade
      t.date :submit_date
      t.integer :participation
      t.integer :liked_pod
      t.integer :learned_in_pod
      t.timestamps
    end
  end
end
