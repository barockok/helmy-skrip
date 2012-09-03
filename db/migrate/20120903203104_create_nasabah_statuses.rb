class CreateNasabahStatuses < ActiveRecord::Migration
  def change
    create_table :nasabah_statuses do |t|
      t.integer :nasabah_id
      t.string :status
      t.text :keterangan

      t.timestamps
    end
  end
end
