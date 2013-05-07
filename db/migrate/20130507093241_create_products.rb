class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.integer :first_credit
      t.integer :month_credit
      t.text :description
      t.integer :months_period
      t.integer :version
      t.string :code

      t.timestamps
    end
  end
end
