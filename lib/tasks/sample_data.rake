require 'faker'

namespace :db do
  desc "Fill database with sample users"
  task :fake_users, [:number] => :environment do |t, args|
    args.with_defaults(:number => 50)
    #Rake::Task['db:reset'].invoke
    args[:number].times do |n|
      username  = Faker::Internet.user_name
      email = Faker::Internet.email
      location = Faker::Address.city + ", " + Faker::Address.us_state_abbr
      password  = "password"
      puts "creating #{username} (#{n} of #{args.number})\n"
      User.create!(:username => username,
                   :email => email,
                   :location => location,
                   :password => password,
                   :password_confirmation => password)
    end
  end
  
  desc "Fill database with sample dreams"
  task :fake_dreams => :environment do
    #Rake::Task['db:reset'].invoke
    user_ids = User.find(:all, :select => "id").map(&:id)
        
    500.times do |n|
      title  = Faker::Company.catch_phrase()
      body = Faker::Lorem.paragraphs(rand(6)+1)
      tag_list = Faker::Lorem.words(4)
      user_id = user_ids.rand
      private = (rand(5) == 0)
      location = Faker::Address.city + ", " + Faker::Address.us_state_abbr
      puts "creating '#{title}'\n"
      Dream.create!(:title => title,
                   :body => body,
                   :user_id => user_id,
                   :location => location,
                   :date => rand(1.year).ago,
                   :feeling => rand(100),
                   :tag_list => tag_list,
                   :private => private)
    end
  end
end
