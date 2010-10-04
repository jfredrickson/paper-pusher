class User < ActiveRecord::Base
  # Devise modules
  devise :database_authenticatable, :recoverable, :rememberable, :trackable,
         :validatable
  
  # Setup accessible (or protected) attributes
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me
end
