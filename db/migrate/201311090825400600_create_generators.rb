class CreateGroups < ActiveRecord::Migration
  def change
    create_table :generators do |t|

      t.integer :student_id

      t.timestamps
    end
  end
end
