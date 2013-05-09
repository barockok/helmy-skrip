class CreateConfigurationItems < ActiveRecord::Migration
  def change
    create_table :configuration_items do |t|
      t.string :key_name
      t.string :the_value

      t.timestamps
    end
  end
end
