class CreateGraphs < ActiveRecord::Migration
  def change
    create_table :graphs do |t|
      t.integer :course_id
      t.text :graph_type
      t.text :categories
      t.timestamps
    end
  end
end
