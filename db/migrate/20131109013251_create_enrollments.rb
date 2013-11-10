class CreateEnrollments < ActiveRecord::Migration
  def change
    create_table :enrollments do |t|
      t.integer :student_id
      t.integer :course_id
      t.integer :pod_id

      t.timestamps
    end
  end
end
