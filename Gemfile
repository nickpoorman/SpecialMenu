require 'rbconfig'
HOST_OS = Config::CONFIG['host_os']
source 'http://rubygems.org'
gem 'rails', '3.1.1'
group :assets do
  gem 'sass-rails',   '~> 3.1.4'
  gem 'coffee-rails', '~> 3.1.1'
  gem 'uglifier', '>= 1.0.3'
end
gem 'jquery-rails'
if HOST_OS =~ /linux/i
  gem 'therubyracer', '>= 0.8.2'
end
gem "bson_ext", ">= 1.3.1"
gem "mongoid", ">= 2.3.0"
gem "frontend-helpers"
gem "rack", "1.3.3"
gem "sorcery"

gem 'awesome_print', :require => 'ap'
gem 'heroku'
gem 'geocoder'
