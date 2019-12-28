class CreateUsersTable < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :password_digest
      t.string :email
      t.text :bio
      t.string :image_url

      t.timestamps null: false
    end
  end
end
