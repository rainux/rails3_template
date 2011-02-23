if RUBY_VERSION == '1.8.7'
  require 'capybara/envjs'
end

Evergreen.configure do |config|
  if defined?(Capybara::Driver::Envjs)
    config.driver = :envjs
  else
    config.driver = :selenium
  end
  config.public_dir = '/public/javascripts'
end
