class User < ActiveRecord::Base
  has_many :sneakers
  has_secure_password

  validates_presence_of  :username, :email, :password_digest
  validates_uniqueness_of :username, presence: {message: "That username is already taken, please use another username."}
  validates_uniqueness_of :email, presence: {message: "That email is already associated to another account. Please use another email."}

include Slugifiable::InstanceMethods
extend Slugifiable::ClassMethods

end
