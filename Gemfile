source 'http://rubygems.org'

gem 'rails', '3.0.6'

gem 'sqlite3-ruby', :require => 'sqlite3'

gem 'rails_admin', :git => 'git://github.com/sferik/rails_admin.git'
gem 'haml-rails', '>= 0.2'
gem 'inherited_resources', '>= 1.1.2'
gem 'will_paginate', '>= 3.0.pre2'
gem 'devise', '>= 1.1.2'
gem 'formtastic', '>= 1.1.0'
gem 'friendly_id', '~> 3.0'
gem 'compass', '>= 0.10.6'
gem 'lemonade', '0.3.4'
gem 'barista', '>= 0.5.0'
gem 'yajl-ruby', :require => 'yajl/json_gem'

group :development do
  gem 'irbtools', :require => nil
  gem 'irbtools-more', :require => nil
  gem 'irb_rocket', :require => nil
  gem 'annotate', :require => nil
  gem 'capistrano', :require => nil
  gem 'rails3-generators'
  gem 'metric_fu', '>= 1.5.1'
end

group :development, :test do
  gem 'awesome_print', :require => 'ap'
  gem 'factory_girl_rails'
  gem 'rspec-rails', '>= 2.0.1'
  gem 'steak'
  gem 'capybara', '>= 0.3.6'
  platforms :mri_18 do
    gem 'ruby-debug'
  end
  platforms :mri_19 do
    gem 'ruby-debug19', :require => 'ruby-debug'
  end
end

group :test do
  gem 'spork', '>= 0.8.4'
  gem 'rspec', '>= 2.0.1'
  gem 'remarkable', '>= 4.0.0.alpha4'
  gem 'remarkable_activemodel', '>= 4.0.0.alpha4'
  gem 'remarkable_activerecord', '>= 4.0.0.alpha4'
  gem 'database_cleaner', '>= 0.5.0'

  gem 'guard'
  gem 'guard-bundler'
  gem 'guard-spork'
  gem 'guard-rspec'
end

group :linux do
  gem 'rb-inotify'
  gem 'libnotify'
end

group :darwin do
  gem 'rb-fsevent'
  gem 'growl'
end
