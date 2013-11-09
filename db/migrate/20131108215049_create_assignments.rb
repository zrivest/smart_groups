class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.string :assignment_name
      t.date :start_date
      t.date :due_date

      t.timestamps
    end
  end
end
