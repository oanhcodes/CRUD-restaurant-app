class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.integer  :creator_id
      t.string   :name
      t.string   :cuisine
      t.string   :address
      t.string   :city
      t.string   :state
      t.string   :zipcode

      t.timestamps(null: false)
    end
  end
end
