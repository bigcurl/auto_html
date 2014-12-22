source "http://rubygems.org"

gemspec

rails_version = ENV["RAILS_VERSION"] || "default"

rails = case rails_version
when "master"
  {github: "rails/rails"}
when "default"
  "~> 4.2.0"
else
  "~> #{rails_version}"
end

gem "rails", rails
gem 'sqlite3', '~> 1.3.3'
gem 'fakeweb'
gem 'addressable', :require => 'addressable/uri'
gem 'rails-html-sanitizer'
