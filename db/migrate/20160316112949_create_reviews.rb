class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer  :reviewer_id
      t.integer  :restaurant_id
      t.integer  :rating
      t.string   :body

      t.timestamps(null: false)
    end
  end
end
