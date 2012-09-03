class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :nama_lengkap
      t.string :role_type
      t.string :username
      t.string :password
      t.string :jabatan

      t.timestamps
    end
  end
end
