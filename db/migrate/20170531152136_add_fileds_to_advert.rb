class AddFiledsToAdvert < ActiveRecord::Migration[5.0]
  def change
    add_column :adverts, :price, :string, default: "Договорная"
  end
end
