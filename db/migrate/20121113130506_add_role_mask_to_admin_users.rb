class AddRoleMaskToAdminUsers < ActiveRecord::Migration
  def change
    add_column :admin_users, :role_mask, :integer
  end
end
