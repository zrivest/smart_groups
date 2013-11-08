class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.integer :grade
      t.date :start_date
      t.date :due_date

      t.timestamps
    end
  end
end
