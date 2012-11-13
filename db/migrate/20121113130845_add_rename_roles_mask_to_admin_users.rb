class AddRenameRolesMaskToAdminUsers < ActiveRecord::Migration
  def change
    rename_column :admin_users, :role_mask,  :roles_mask
  end
end
