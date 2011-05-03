class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :username, :password, :password_confirmation, :remember_me
  
  has_many :dreams
  validates_format_of :username,
                      :with => /^[A-Z0-9_]*$/i,
                      :message => "must contain only letters, numbers, and underscores."
  
end
