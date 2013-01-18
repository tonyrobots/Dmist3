source 'http://rubygems.org'

gem 'rails', '3.1.0'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'


# devise 2.0.x/omniauth
gem 'devise'
gem 'omniauth'
gem 'omniauth-facebook'

gem 'jquery-rails'
gem 'rails-asset-jqueryui'
gem 'acts-as-taggable-on'
gem 'paperclip'
gem "kaminari"  
gem 'faker'
gem 'aws-s3'
gem 'aws-sdk', '~> 1.3.4'
gem 'ajaxful_rating_jquery', :git => 'git://github.com/danbee/ajaxful_rating_jquery.git'
gem 'rails_admin', :git => 'git://github.com/sferik/rails_admin.git'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger (ruby-debug for Ruby 1.8.7+, ruby-debug19 for Ruby 1.9.2+)
# gem 'ruby-debug'
# gem 'ruby-debug19', :require => 'ruby-debug'

# Bundle the extra gems:
# gem 'bj'
# gem 'nokogiri'
# gem 'sqlite3-ruby', :require => 'sqlite3'
# gem 'aws-s3', :require => 'aws/s3'

# Bundle gems for the local environment. Make sure to
# put test-only gems in this group so their generators
# and rake tasks are available in development mode:
group :development, :test do
    gem 'unicorn'
	gem 'sqlite3', '~> 1.3.4'
	#gem 'mysql2', '~> 0.3.7' 
end

group :production do
  gem 'rack-google_analytics', :require => "rack/google_analytics"
  gem 'pg'
  gem 'thin'
  #gem 'therubyracer-heroku', '0.8.1.pre3'
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   "3.1.5"
  gem 'coffee-rails', "~> 3.1.0"
  gem 'uglifier'
end
