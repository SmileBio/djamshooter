class AddNewFieldToAdverts < ActiveRecord::Migration[5.0]
  def change
    add_reference :adverts, :region, foreign_key: true
    add_reference :adverts, :city, foreign_key: true
  end
end
