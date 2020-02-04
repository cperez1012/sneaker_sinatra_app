class Sneaker < ActiveRecord::Base
  belongs_to :user

  validates :name, :image_url, :description, :category, :user_id, presence: true
end
