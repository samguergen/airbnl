class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :location
      t.date :start_date
      t.date :end_date
      t.integer :price
      t.text :description
      t.string :photo_url
      t.references :user
    end
  end
end
