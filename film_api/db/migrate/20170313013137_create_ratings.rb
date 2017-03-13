class CreateRatings < ActiveRecord::Migration[5.0]
  def change
    create_table :ratings do |t|
      t.integer :user_id
      t.integer :film_id
      t.integer :rating
      t.timestamps null: false
    end
  end
end
