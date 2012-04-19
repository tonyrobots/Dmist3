class User < ActiveRecord::Base
  
  # this is for avatar upload via url
  require 'open-uri'
  
  # Role definitions
  ADMIN = 1
  USER  = 0
  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable
  
  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :username, :password, :password_confirmation, :remember_me, :avatar, :location, :role, :avatar_remote_url, :fbid
  
  acts_as_tagger
  ajaxful_rater
  
  # relationships
  has_many :dreams
  has_many :comments, :as => :commentable  
  
  # use paperclip for avatars
   has_attached_file :avatar,  :styles => { :large => "325x325>", :medium => "200x200>", :thumb => "48x48#" },
                                           :path => "/avatars/:id/:style_:id.:extension",
                                           :default_style => :thumb,
                                           :default_url => "/assets/avatars/:style_missing.png",
                                           :storage => :s3,
                                           :s3_credentials => "#{Rails.root}/config/s3.yml"

  
  # validations
  
  validates_attachment_size :avatar, :less_than => 500.kilobytes, :message => 'must be under 500kb'
  validates_attachment_content_type :avatar, :content_type => ['image/jpeg', 'image/png', 'image/gif']
  validates_format_of :username,
                      :with => /^[A-Z0-9_\.]*$/i,
                      :message => "must contain only letters, numbers, periods, and underscores."
                      
  validates_presence_of :username
  validates_uniqueness_of :username  
  
                      
  def self.find_for_facebook_oauth(access_token, signed_in_resource=nil)
    #data = access_token['extra']['user_hash']
    data = access_token.extra.raw_info
    logger.debug access_token.to_yaml
    
    # if user already exists in database, just add the fbid and successfully authenticate
    # TODO pull avatar from facebook if none is already set?
    if user = User.find_by_email(data["email"])
      unless user.fbid
        user.fbid = data["id"]
        user.save
      end
      user
    else # Create a user with a stub password. 
      #assigns FB username to username if available, otherwise, it's firstname.lastname
      #TODO fix for cases when first.last is already taken
      name = data["username"]?data["username"] : data["first_name"] + "." + data["last_name"]
      #avatar = open(URI.parse("http://eoimages.gsfc.nasa.gov/images/imagerecords/6000/6226/aurora_img_2005254.jpg"))
      #logger.debug "pic url is  #{data["birthday"]} - #{data["pic_big_with_logo"]} - #{data["sex"]}"
      if avatar_url = "http://graph.facebook.com/#{data.id}/picture?type=large"
        avatar = open(URI.parse(avatar_url))
      end
      User.create!(:email => data["email"], :username => name, :fbid => data["id"], :avatar => avatar, :avatar_remote_url => avatar_url, :password => Devise.friendly_token[0,20]) 
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
  
  def is_admin?
    self.role == ADMIN
  end
  
  
  # just for invite_code validation
if SITE_IS_PRIVATE
    validate do |user|
      code_hash = "494104dd992f3d033f11ae28613bf53c1c5ba08b" + user.email
      user.errors[:base] << "Please check invite code" if user.invite_code != Digest::SHA1.hexdigest(code_hash)
    end
  end
end
