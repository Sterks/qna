source 'https://rubygems.org'
gem 'rails', '4.2.6'
gem 'pg', '~> 0.15'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 2.0'
gem 'sdoc', '~> 0.4.0', group: :doc
gem 'slim-rails'
gem 'unicorn'

group :development do
  gem 'capistrano', require: false
  gem 'capistrano-rvm', require: false
  gem 'capistrano-bundler', require: false
  gem 'capistrano-rails', require: false
  gem 'capistrano3-unicorn', require: false
end
group :test do
  gem 'shoulda-matchers', '~> 3.1', '>= 3.1.1'
  gem 'rspec-rails'
  gem 'factory_girl_rails'
end
group :development, :test do
  gem 'byebug'
end
group :development do
  gem 'web-console', '~> 2.0'
  gem 'spring'
end
group :production do
  gem 'dotenv'
  gem 'dotenv-deployment', require: 'dotenv/deployment'
end
