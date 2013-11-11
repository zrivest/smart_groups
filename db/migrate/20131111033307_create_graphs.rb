class CreateMetrics < ActiveRecord::Migration
  def change
    create_table :metrics do |t|
      t.integer :course_id
      t.timestamps
    end
  end
end
