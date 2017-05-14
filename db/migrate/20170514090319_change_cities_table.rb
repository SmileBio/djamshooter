class ChangeCitiesTable < ActiveRecord::Migration[5.0]
  def change
    add_reference :cities, :region, foreign_key: true
    #remove_column :cities, :region_id
  end
end
