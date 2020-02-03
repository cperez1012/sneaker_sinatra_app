class CreateSneakers < ActiveRecord::Migration
  def change
    create_table :sneakers do |t|
      t.string :name
      t.text :description
      t.string :category
      t.integer :user_id
      t.string :image_url

      t.timestamps null: false
    end
  end
end
