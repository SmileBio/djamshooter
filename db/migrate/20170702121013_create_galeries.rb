class CreateGaleries < ActiveRecord::Migration[5.0]
  def change
    create_table :galeries do |t|
      t.string :title
      t.references :merchant_page
      t.timestamps
    end
  end
end
