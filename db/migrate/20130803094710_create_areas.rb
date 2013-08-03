class CreateAreas < ActiveRecord::Migration
  def change
    create_table :areas do |t|
      t.string :name
      t.string :langitude
      t.string :latitude
      t.string :address

      t.timestamps
    end
  end
end
