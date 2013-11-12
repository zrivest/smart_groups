class CreatePlots < ActiveRecord::Migration
  def change
    create_table :plots do |t|
      t.integer :data, array: true
      t.timestamps
    end
  end
end
