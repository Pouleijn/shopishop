source 'https://rubygems.org'

gem 'rails', '3.2.3'

gem 'acts_as_list'
gem 'airbrake', github: 'airbrake/airbrake'
gem 'i18n-airbrake'
gem 'aws-sdk', '~> 1.3.4'
gem 'bcrypt-ruby', '~> 3.0.0'
gem 'jquery-rails'
gem 'paperclip', '~> 3.0'
gem 'pg'
gem 'simple_form'
gem 'unicorn'

group :assets do
  gem 'sass-rails', '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'bootstrap-sass', '~> 2.0.2'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platform => :ruby

  gem 'uglifier', '>= 1.0.3'
end


group :development do
  gem 'capistrano'
  gem 'quiet_assets'
  #gem 'ruby-debug19', :require => 'ruby-debug'
  gem 'thin'
  gem 'bullet'
  gem 'brakeman'
end

group :developement, :test do
  gem 'rspec-rails'
  gem 'shoulda-matchers'
  gem 'factory_girl'
  gem 'guard'
  gem 'guard-bundler'
  gem 'guard-rspec'
  gem 'guard-brakeman'
  gem 'database_cleaner'
  gem 'simplecov', :require => 'simplecov'
end
