class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password
      t.string :phone_number
      t.string :auth_key
      t.integer :area_id

      t.timestamps
    end
  end
end
