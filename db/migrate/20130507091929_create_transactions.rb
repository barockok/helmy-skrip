class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.integer :nasabah_id
      t.integer :debit
      t.integer :credit
      t.string :description
      t.integer :product_id

      t.timestamps
    end
  end
end
