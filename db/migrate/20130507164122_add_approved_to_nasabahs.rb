class AddApprovedToNasabahs < ActiveRecord::Migration
  def change
    add_column :nasabahs, :approved, :boolean, :defautl => false
  end
end
