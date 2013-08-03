class CreateCourts < ActiveRecord::Migration
  def change
    create_table :courts do |t|
      t.string :name
      t.string :address
      t.integer :area_id

      t.timestamps
    end
  end
end
