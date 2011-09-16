#         ooooooooo.              o8o  oooo                 .o.             .o8                     o8o              
#         `888   `Y88.            `"'  `888                .888.           "888                     `"'              
#          888   .d88'  .oooo.   oooo   888   .oooo.o     .8"888.      .oooo888  ooo. .oo.  .oo.   oooo  ooo. .oo.   
#          888ooo88P'  `P  )88b  `888   888  d88(  "8    .8' `888.    d88' `888  `888P"Y88bP"Y88b  `888  `888P"Y88b  
#          888`88b.     .oP"888   888   888  `"Y88b.    .88ooo8888.   888   888   888   888   888   888   888   888  
#          888  `88b.  d8(  888   888   888  o.  )88b  .8'     `888.  888   888   888   888   888   888   888   888  
#         o888o  o888o `Y888""8o o888o o888o 8""888P' o88o     o8888o `Y8bod88P" o888o o888o o888o o888o o888o o888o 

# RailsAdmin config file. Generated on September 11, 2011 12:26
# See github.com/sferik/rails_admin for more informations

RailsAdmin.config do |config|
  
  config.current_user_method { current_user } #auto-generated

  #  ==> Authentication (before_filter)
  # This is run inside the controller instance so you can setup any authentication you need to.
  # By default, the authentication will run via warden if available.
  # and will run on the default user scope.
  # If you use devise, this will authenticate the same as authenticate_user!
  # Example Devise admin
  # RailsAdmin.config do |config|
  #   config.authenticate_with do
  #     authenticate_admin!
  #   end
  # end
  # Example Custom Warden
  # RailsAdmin.config do |config|
  #   config.authenticate_with do
  #     warden.authenticate! :scope => :paranoid
  #   end
  # end
  
  #  ==> Authorization
  # Use cancan https://github.com/ryanb/cancan for authorization:
  # config.authorize_with :cancan
  
  # Or use a custom dead-stupid authorization rule:
   config.authorize_with do
     redirect_to "/" unless warden.user.is_admin?
   end
  
  # Use a specific role for ActiveModel's :attr_acessible :attr_protected
  # Default is :default
  # current_user is accessible in the block if you want to make it user specific.
  # config.attr_accessible_role { :default }
  
  #  ==> Dev. settings
  # Reload rails_admin with each request (can be slow) in development mode
  # config.reload_between_requests = true
  
  #  ==> Global show view settings
  # Display empty fields in show views
  # config.compact_show_view = false
  
  #  ==> Global list view settings
  # Number of default rows per-page:
  # config.default_items_per_page = 50
  
  #  ==> Included models
  # Add all excluded models here:
  # config.excluded_models << [Comment, Dream, Rate, User]
  
  # Add models here if you want to go 'whitelist mode':
  # config.included_models << [Comment, Dream, Rate, User]
  
  # Application wide tried label methods for models' instances
  # config.label_methods << [:description] # Default is [:name, :title]
  
  #  ==> Global models configuration
  # config.models do
  #   # Configuration here will affect all included models in all scopes, handle with care!
  #   
  #   list do
  #     # Configuration here will affect all included models in list sections (same for show, export, edit, update, create)
  #     
  #     fields :name, :other_name do
  #       # Configuration here will affect all fields named [:name, :other_name], in the list section, for all included models
  #     end
  #     
  #     fields_of_type :date do
  #       # Configuration here will affect all date fields, in the list section, for all included models. See README for a comprehensive type list.
  #     end
  #   end
  # end
  #
  #  ==> Model specific configuration
  # Keep in mind that *all* configuration blocks are optional. 
  # RailsAdmin will try his best to provide the best defaults for each section, for each field! 
  # Try to override as few things as possible, in the most generic way. Try to avoid setting labels for models and attributes, use ActiveRecord I18n API instead. 
  # Less code is better code!
  # config.model MyModel do
  #   # Here goes your cross-section field configuration for ModelName.
  #   object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
  #   label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #   label_plural 'My models'      # Same, plural
  #   weight -1                     # Navigation priority. Bigger is higher.
  #   parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #   navigation_label              # Sets dropdown entry's name in navigation. Only for parents!
  #   # Section specific configuration:
  #   list do
  #     filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #     items_per_page 100    # Override default_items_per_page
  #     sort_by :id           # Sort column (default is primary key)
  #     sort_reverse true     # Sort direction (default is true for primary key, last created first)
  #     # Here goes the fields configuration for the list view
  #   end
  #   show do
  #     # Here goes the fields configuration for the show view
  #   end
  #   export do
  #     # Here goes the fields configuration for the export view (CSV, yaml, XML)
  #   end
  #   edit do
  #     # Here goes the fields configuration for the edit view (for create and update view)
  #   end
  #   create do
  #     # Here goes the fields configuration for the create view, overriding edit section settings
  #   end
  #   update do
  #     # Here goes the fields configuration for the update view, overriding edit section settings
  #   end
  # end
  
# fields configuration is described in the Readme, if you have other question, ask us on the mailing-list! 

#  ==> Your models configuration, to help you get started!

# All fields marked as 'hidden' won't be shown anywhere in the rails_admin unless you mark them as visible.
# There can be different reasons for that:
#  - belongs_to _id and _type (polymorphic) columns are hidden in favor of their associations
#  - associations are hidden if they have no matchable model found (model not included or non-existant)
#  - they are part of a bigger plan in a plugin (Devise/Paperclip) and hidden by contract
# Some fields may be hidden depending on the section, if they aren't deemed suitable for display or edition on that section
#  - non-editable columns (:id, :created_at, ..) in edit sections
#  - has_many/has_one associations in list section (hidden by default for performance reasons)
# Fields may also be marked as read_only (and thus not editable) if they are not mass-assignable by current_user

  # config.model Comment do
  #   # Found associations: 
  #   field :commentable, :polymorphic_association
  #   field :user, :belongs_to_association
  #   # Found columns:
  #   field :id, :integer
  #   field :body, :text
  #   field :commentable_id, :integer        # Hidden
  #   field :commentable_type, :string        # Hidden
  #   field :user_id, :integer        # Hidden
  #   field :created_at, :datetime
  #   field :updated_at, :datetime
  #   # Sections: 
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  #  end

# All fields marked as 'hidden' won't be shown anywhere in the rails_admin unless you mark them as visible.
# There can be different reasons for that:
#  - belongs_to _id and _type (polymorphic) columns are hidden in favor of their associations
#  - associations are hidden if they have no matchable model found (model not included or non-existant)
#  - they are part of a bigger plan in a plugin (Devise/Paperclip) and hidden by contract
# Some fields may be hidden depending on the section, if they aren't deemed suitable for display or edition on that section
#  - non-editable columns (:id, :created_at, ..) in edit sections
#  - has_many/has_one associations in list section (hidden by default for performance reasons)
# Fields may also be marked as read_only (and thus not editable) if they are not mass-assignable by current_user

  # config.model Dream do
  #   # Found associations: 
  #   field :user, :belongs_to_association
  #   field :comments, :has_many_association
  #   field :taggings, :has_many_association        # Hidden
  #   field :base_tags, :has_many_association        # Hidden
  #   field :tag_taggings, :has_many_association        # Hidden
  #   field :tags, :has_many_association        # Hidden
  #   field :rates_without_dimension, :has_many_association
  #   field :raters_without_dimension, :has_many_association
  #   field :interestingness_rates, :has_many_association
  #   field :interestingness_raters, :has_many_association
  #   field :weirdness_rates, :has_many_association
  #   field :weirdness_raters, :has_many_association
  #   field :writing_rates, :has_many_association
  #   field :writing_raters, :has_many_association
  #   # Found columns:
  #   field :id, :integer
  #   field :user_id, :integer        # Hidden
  #   field :title, :string
  #   field :body, :text
  #   field :date, :date
  #   field :visible, :boolean
  #   field :explicit, :boolean
  #   field :location, :string
  #   field :created_at, :datetime
  #   field :updated_at, :datetime
  #   field :feeling, :integer
  #   field :private, :boolean
  #   # Sections: 
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  #  end

# All fields marked as 'hidden' won't be shown anywhere in the rails_admin unless you mark them as visible.
# There can be different reasons for that:
#  - belongs_to _id and _type (polymorphic) columns are hidden in favor of their associations
#  - associations are hidden if they have no matchable model found (model not included or non-existant)
#  - they are part of a bigger plan in a plugin (Devise/Paperclip) and hidden by contract
# Some fields may be hidden depending on the section, if they aren't deemed suitable for display or edition on that section
#  - non-editable columns (:id, :created_at, ..) in edit sections
#  - has_many/has_one associations in list section (hidden by default for performance reasons)
# Fields may also be marked as read_only (and thus not editable) if they are not mass-assignable by current_user

  # config.model Rate do
  #   # Found associations: 
  #   field :rater, :belongs_to_association
  #   field :rateable, :polymorphic_association
  #   # Found columns:
  #   field :id, :integer
  #   field :rater_id, :integer        # Hidden
  #   field :rateable_id, :integer        # Hidden
  #   field :rateable_type, :string        # Hidden
  #   field :stars, :integer
  #   field :dimension, :string
  #   field :created_at, :datetime
  #   field :updated_at, :datetime
  #   # Sections: 
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  #  end

# All fields marked as 'hidden' won't be shown anywhere in the rails_admin unless you mark them as visible.
# There can be different reasons for that:
#  - belongs_to _id and _type (polymorphic) columns are hidden in favor of their associations
#  - associations are hidden if they have no matchable model found (model not included or non-existant)
#  - they are part of a bigger plan in a plugin (Devise/Paperclip) and hidden by contract
# Some fields may be hidden depending on the section, if they aren't deemed suitable for display or edition on that section
#  - non-editable columns (:id, :created_at, ..) in edit sections
#  - has_many/has_one associations in list section (hidden by default for performance reasons)
# Fields may also be marked as read_only (and thus not editable) if they are not mass-assignable by current_user

  # config.model User do
  #   # Found associations: 
  #   field :owned_taggings, :has_many_association        # Hidden
  #   field :owned_tags, :has_many_association        # Hidden
  #   field :ratings_given, :has_many_association
  #   field :dreams, :has_many_association
  #   field :comments, :has_many_association
  #   # Found columns:
  #   field :id, :integer
  #   field :email, :string
  #   field :password, :password
  #   field :password_confirmation, :password
  #   field :password_salt, :string        # Hidden
  #   field :reset_password_token, :string        # Hidden
  #   field :remember_token, :string        # Hidden
  #   field :remember_created_at, :datetime
  #   field :sign_in_count, :integer
  #   field :current_sign_in_at, :datetime
  #   field :last_sign_in_at, :datetime
  #   field :current_sign_in_ip, :string
  #   field :last_sign_in_ip, :string
  #   field :confirmation_token, :string
  #   field :confirmed_at, :datetime
  #   field :confirmation_sent_at, :datetime
  #   field :created_at, :datetime
  #   field :updated_at, :datetime
  #   field :username, :string
  #   field :fbid, :integer
  #   field :avatar_file_name, :string        # Hidden
  #   field :avatar_content_type, :string        # Hidden
  #   field :avatar_file_size, :integer        # Hidden
  #   field :avatar_updated_at, :datetime        # Hidden
  #   field :avatar, :paperclip_file
  #   field :location, :string
  #   field :role, :integer
  #   # Sections: 
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  #  end

end

# You made it this far? You're looking for something that doesn't exist! Add it to RailsAdmin and send us a Pull Request!