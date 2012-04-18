# Load the rails application
require File.expand_path('../application', __FILE__)

FACEBOOK = YAML.load_file("#{Rails.root}/config/facebook.yml")[Rails.env]

# Initialize the rails application
Dream3::Application.initialize!
