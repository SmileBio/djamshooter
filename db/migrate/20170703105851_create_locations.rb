class CreateLocations < ActiveRecord::Migration[5.0]
  def change
    create_table :locations do |t|
      t.belongs_to :merchant_page, index: true
      t.belongs_to :city, index: true
      t.belongs_to :region, index: true
      t.timestamps
    end
  end
end
