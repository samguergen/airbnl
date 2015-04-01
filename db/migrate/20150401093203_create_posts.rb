class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title, null:false
      t.string :location, null:false
      t.date :start_date
      t.date :end_date
      t.integer :price, null:false
      t.text :description
      t.string :photo_url
      t.references :user

      t.timestamps
    end
  end
end
