class Dream < ActiveRecord::Base
  belongs_to :user
  default_scope :order => 'created_at DESC'
  
  has_many :comments, :as => :commentable  
  #accepts_nested_attributes_for :comments
  
  validates_presence_of :title, :body
  
  acts_as_taggable_on :tags

  ajaxful_rateable :stars =>5, :dimensions => [:interestingness, :weirdness, :writing]
  
end
