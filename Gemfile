source "https://rubygems.org"

gemspec

git "http://github.com/refinery/refinerycms", branch: "master" do
  gem "refinerycms"
  gem "refinerycms-testing"
end

gem "refinerycms-i18n", git: "https://github.com/refinery/refinerycms-i18n",
                        branch: "master"

gem 'sqlite3'
gem 'pry'

group :development, :test do
  gem 'selenium-webdriver', '~> 2.43'
end
