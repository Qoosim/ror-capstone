source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.1'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.0.3', '>= 6.0.3.2'
# User bootstrap-sass to css styling
gem 'bootstrap-sass', '~> 3.4', '>= 3.4.1'
# Use postgresql as the database for Active Record
gem 'pg', '>= 0.18', '< 2.0'
# Use Puma as the app server
gem 'puma', '~> 4.1'
# Use SCSS for stylesheets
gem 'sass-rails', '>= 6'
gem 'sassc', '~> 2.1.0'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker', '~> 4.0'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.7'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
gem 'bcrypt', '~> 3.1.7'
# It provides a mini view framework for console applications
gem 'hirb', '~> 0.7.3'
# Rails gem to allowing records to be votable
gem 'font-awesome-sass', '~> 5.13'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

gem 'carrierwave', '~> 2.1'
gem 'cloudinary', '~> 1.16', '>= 1.16.1'
gem 'mini_magick', '~> 4.10', '>= 4.10.1'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.2', require: false

group :development, :test do
  gem 'database_cleaner', '~> 1.8', '>= 1.8.5'
  # Use rspec for testing
  gem 'rspec-rails', '~> 4.0', '>= 4.0.1'
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
end

group :test do
  # Add support for rails Rspec
  gem 'capybara', '~> 3.33'
  gem 'rails-controller-testing', '~> 1.0'
  # gem 'rspec-rails', '~> 4.0'
  gem 'selenium-webdriver', '~> 3.142'
  gem 'shoulda', '~> 4.0'
  gem 'shoulda-matchers', '~> 4.3'

  gem 'test-unit', '~> 3.3', '>= 3.3.5'
  # Easy installation and use of chromedriver to run system tests with Chrome
  gem 'chromedriver-helper', '~> 2.1', '>= 2.1.1'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'listen', '~> 3.2'
  gem 'web-console', '>= 3.3.0'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :production do
  # postgre SQL GEM
  gem 'fog', '1.42'
  gem 'rails_12factor', '~> 0.0.3'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
