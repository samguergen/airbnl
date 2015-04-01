class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.integer :age
      t.string :photo_url
      t.string :email
      t.string :password_digest
      t.string :language
      t.text :description
    end
  end
end
