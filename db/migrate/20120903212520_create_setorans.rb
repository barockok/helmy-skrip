class CreateSetorans < ActiveRecord::Migration
  def change
    create_table :setorans do |t|
      t.integer :nasabah_id
      t.integer :actor_id
      t.integer :amount
      t.integer :term

      t.timestamps
    end
  end
end
