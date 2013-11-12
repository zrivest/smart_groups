class CreatePlots < ActiveRecord::Migration
  def change
    create_table :plots do |t|
      t.integer :data, array: true
      t.string :plot_name
      t.timestamps
    end
  end
end
