class CreatePlots < ActiveRecord::Migration
  def change
    create_table :plots do |t|
      t.text :data
      t.string :plot_name
      t.timestamps
    end
  end
end
