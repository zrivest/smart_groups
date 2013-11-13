class CreatePods < ActiveRecord::Migration
  def change
    create_table :pods do |t|
      t.integer :group_id
      t.integer :student_id

      t.timestamps
    end
  end
end
