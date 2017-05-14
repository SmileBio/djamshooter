class CreateRegions < ActiveRecord::Migration[5.0]
  def change
    create_table :regions do |t|
      t.string :title, limit: 70
      t.timestamps
    end
  end
end
