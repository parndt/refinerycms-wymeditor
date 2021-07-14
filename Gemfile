source "https://rubygems.org"

gemspec

git "https://github.com/refinery/refinerycms", branch: "master" do
  gem 'refinerycms'

  group :development, :test do
    gem 'refinerycms-testing'
  end
end

# routing-filter needs a newer release than version 0.6.3
gem 'refinerycms-i18n', github: 'refinery/refinerycms-i18n', branch: 'master'
gem 'routing-filter', github: 'svenfuchs/routing-filter', branch: 'master'

group :test do
  gem 'launchy'
  gem 'listen'
  gem 'pry'
  gem 'puma'
  gem 'rspec-retry'
  gem 'selenium-webdriver'
end

# Database Configuration
unless ENV['CI']
  gem 'activerecord-jdbcsqlite3-adapter', :platform => :jruby
  gem 'sqlite3', :platform => :ruby
end

if !ENV['CI'] || ENV['DB'] == 'mysql'
  gem 'activerecord-jdbcmysql-adapter', :platform => :jruby
  gem 'jdbc-mysql', '= 5.1.13', :platform => :jruby
  gem 'mysql2', :platform => :ruby
end

if !ENV['CI'] || ENV['DB'] == 'postgresql'
  gem 'activerecord-jdbcpostgresql-adapter', :platform => :jruby
  gem 'pg', :platform => :ruby
end

# Refinery/rails should pull in the proper versions of these
group :assets do
  gem 'sass-rails'
  gem 'coffee-rails'
end

# Load local gems according to Refinery developer preference.
if File.exist? local_gemfile = File.expand_path('../.gemfile', __FILE__)
  eval File.read(local_gemfile)
end
