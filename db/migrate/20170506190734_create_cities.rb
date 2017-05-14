class CreateCities < ActiveRecord::Migration[5.0]
  def change
    create_table :cities do |t|
      t.string :title, limit: 70
      t.integer :region_id
      t.timestamps
    end
  end
end
