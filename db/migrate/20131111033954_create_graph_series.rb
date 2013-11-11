class CreateGraphSeries < ActiveRecord::Migration
  def change
    create_table :graph_serieses do |t|
      t.integer :series_id
      t.integer :graph_id
      t.timestamps
    end
  end
end
