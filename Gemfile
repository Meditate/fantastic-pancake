source "https://rubygems.org"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


gem "rails", "5.1.0.rc1"
gem "pg"
gem "puma", "~> 3.0"
gem "dalli"
gem "sass-rails", "~> 5.0"
gem "uglifier", ">= 1.3.0"
gem "coffee-rails", "~> 4.2"
gem "jquery-rails"
gem "turbolinks", "~> 5"
gem "jbuilder", "~> 2.5"
gem "hirb", require: false

group :development, :test do
  gem "byebug", platform: :mri
  gem "factory_girl_rails", "~> 4.7"
  gem "rubocop-rspec"
  gem "guard-rspec"
  gem "shoulda-matchers", "~> 3.1", ">= 3.1.1"
  gem "overcommit", require: false
  gem "rspec-rails", "~> 3.5"
end

group :development do
  gem "rubocop", require: false
  gem "guard"
  gem "web-console", ">= 3.3.0"
  gem "listen", "~> 3.0.5"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
end

gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
