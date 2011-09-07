class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :username, :password, :password_confirmation, :remember_me, :avatar, :location
  
  acts_as_tagger
  
  # relationships
  has_many :dreams
  has_many :comments, :as => :commentable  
  
  # use paperclip for avatars
   has_attached_file :avatar,  :styles => { :large => "325x325>", :medium => "200x200>", :thumb => "48x48#" },
                                           :path => "/avatars/:id/:style_:id.:extension",
                                           :default_style => :thumb,
                                           :default_url => "/images/avatars/:style_missing.png",
					   :storage => :s3,
                                          :s3_credentials => "#{Rails.root}/config/s3.yml"

  
  # validations
  
  validates_attachment_size :avatar, :less_than => 1.megabyte  
  validates_attachment_content_type :avatar, :content_type => ['image/jpeg', 'image/png', 'image/gif']
  validates_format_of :username,
                      :with => /^[A-Z0-9_\.]*$/i,
                      :message => "must contain only letters, numbers, periods, and underscores."
                      
  validates_presence_of :username
                      
  def self.find_for_facebook_oauth(access_token, signed_in_resource=nil)
    data = access_token['extra']['user_hash']
    # if user already exists in database, just add the fbid and successfully authenticate
    if user = User.find_by_email(data["email"])
      unless user.fbid
        user.fbid = data["id"]
        user.save
      end
      user
    else # Create a user with a stub password. 
      name = data["username"]
      User.create!(:email => data["email"], :username => name, :fbid => data["id"], :password => Devise.friendly_token[0,20]) 
    end
  end
  
  def self.new_with_session(params, session)
     super.tap do |user|
       if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["user_hash"]
         user.email = data["email"]
         user.username = data["username"]
         user.fbid = data["id"]
       end
     end
  end
  
end
