class CreateGraphPlots < ActiveRecord::Migration
  def change
    create_table :graph_plots do |t|
      t.integer :plot_id
      t.integer :graph_id
      t.timestamps
    end
  end
end
