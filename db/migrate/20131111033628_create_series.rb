class CreateSeries < ActiveRecord::Migration
  def change
    create_table :serieses do |t|
      t.integer[] :data
      t.timestamps
    end
  end
end
