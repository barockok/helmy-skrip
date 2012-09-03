class AddActorIdToNasabahStatuses < ActiveRecord::Migration
  def change
    add_column :nasabah_statuses, :actor_id, :integer
  end
end
