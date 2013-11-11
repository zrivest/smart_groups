class CreateSeries < ActiveRecord::Migration
  def change
    create_table :serieses do |t|
      t.integer :data, array: true
      t.timestamps
    end
  end
end
