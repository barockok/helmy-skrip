class ChangeDefaultApprovedNasabahs < ActiveRecord::Migration
  def up
  	change_column :nasabahs, :approved, :string, :default => nil
  end

  def down
  	# change_column :nasabahs, :approved, :string, :default => true
  end
end
