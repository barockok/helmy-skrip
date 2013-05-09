class CreateAdministrationFees < ActiveRecord::Migration
  def change
    create_table :administration_fees do |t|
      t.string :description
      t.integer :amount

      t.timestamps
    end
  end
end
