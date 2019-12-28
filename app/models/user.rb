class User < ActiveRecord::Base
  has_many :sneakers
  has_secure_password
end
