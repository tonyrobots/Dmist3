class Dream < ActiveRecord::Base
  belongs_to :user
  
  has_many :comments, :as => :commentable  
  #accepts_nested_attributes_for :comments
  
  validates_presence_of :title, :body
end
