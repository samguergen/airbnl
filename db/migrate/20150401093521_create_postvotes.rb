class CreatePostvotes < ActiveRecord::Migration
  def change
    create_table :postvotes do |t|
      t.integer :upvote
      t.integer :downvote
      t.references :post
      t.references :user
    end
  end
end
