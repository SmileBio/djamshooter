class CreateJoinTableUsersCities < ActiveRecord::Migration[5.0]
  def change
    create_table :cities_users, :id => false do |t|
      t.references :user, null: false
      t.references :city, null: false
    end
  end
end
