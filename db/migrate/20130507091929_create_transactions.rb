class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.integer :nasabah_id
      t.integer :debit, :default => 0
      t.integer :credit, :default => 0
      t.string :description
      t.integer :product_id

      t.timestamps
    end
  end
end
