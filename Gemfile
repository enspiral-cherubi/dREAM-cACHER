source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.3'
# Use postgresql as the database for Active Record
gem 'pg'
# Use SCSS for stylesheets
# gem 'sass-rails', '~> 5.0'

# # Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'jbuilder', '~> 2.0'

# bundle exec rake doc:rails generates the API under doc/api.
# gem 'sdoc', '~> 0.4.0', group: :doc

gem 'devise_token_auth'

gem 'omniauth'

# gem 'omniauth-facebook'

# gem "figaro"

gem 'sentimental'

gem 'engtagger'

# allow cross origin resourse sharing
gem 'rack-cors', :require => 'rack/cors'

gem 'rails_12factor'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'

  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'

  gem 'rspec-rails', '~> 3.0'

  gem 'faker'

  gem 'factory_girl_rails'


  gem 'capistrano', '~> 3.4.0'
  gem 'capistrano-rails', '~> 1.1.3'
  gem 'capistrano-rbenv', '~> 2.0.3'

end

group :test do
  gem 'shoulda-matchers', require: false
  gem 'capybara', '~> 2.4.4'
  gem 'chromedriver-helper'
  gem 'selenium-webdriver'
  gem 'database_cleaner'
end