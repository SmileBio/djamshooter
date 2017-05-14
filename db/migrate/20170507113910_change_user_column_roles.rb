class ChangeUserColumnRoles < ActiveRecord::Migration[5.0]
  def change
    change_column_default :users, :user_roles, from: nil, to: "user"
  end
end
