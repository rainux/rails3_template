require 'pathname'
source = Pathname.new(File.dirname(__FILE__))

run "rm -Rf .gitignore README public/index.html public/javascripts/* test app/views/layouts/*"
run "cp #{source.join('gitignore')} .gitignore"
git :init
git :add => '.gitignore'
git :commit => "-am 'Initial commit'"
run 'cp config/database.yml config/database.yml.example'
git :add => '.'
git :add => '-f public/stylesheets/.gitkeep'
git :commit => "-am 'Rails 3 app generated'"

run "cp #{source.join('Gemfile')} ."

run "bundle install"

plugin 'asset_packager', :git => 'git://github.com/sbecker/asset_packager.git'

application <<-GENERATORS
  config.generators do |g|
      g.template_engine :haml
      g.test_framework  :rspec, :fixture => true, :views => false
      g.integration_tool :rspec, :fixture => true, :views => true
      g.fixture_replacement :factory_girl, :dir => "spec/support/factories"
    end
GENERATORS

generate "rspec:install"
generate "steak:install"
generate "friendly_id"
generate "formtastic:install"
generate "devise:install"
generate "devise User"
generate "devise Admin"
generate "rails_admin:install_admin"
generate "barista:install"
run "compass init --using blueprint --app rails --css-dir public/stylesheets --sass-dir app/stylesheets"
append_file "config/compass.rb", "require 'lemonade'"

run "rm public/stylesheets/*"

run "wget --no-check-certificate 'https://github.com/rails/jquery-ujs/raw/master/src/rails.js' -O public/javascripts/rails.js"
run "cp #{source.join('screen.scss')} app/stylesheets/screen.scss"
run "cp #{source.join('print.scss')} app/stylesheets/print.scss"
run "cp #{source.join('application.html.haml')} app/views/layouts/application.html.haml"
run "cp #{source.join('factory_girl.rb')} features/support/factory_girl.rb"
run "cp #{source.join('remarkable.rb')} spec/support/remarkable.rb"
run "cp #{source.join('users.rb')} spec/support/factories/users.rb"
run "cp #{source.join('build.rake')} lib/tasks/build.rake"
run "cp #{source.join('bootstrap.rake')} lib/tasks/bootstrap.rake"
run "cp #{source.join('build.sh')} build.sh"
run "cp #{source.join('overlay.png')} public/images/overlay.png"
run "cp #{source.join('newrelic.yml')} config/newrelic.yml"
run "cp #{source.join('hoptoad.rb')} config/initializers/hoptoad.rb"
run "cp #{source.join('rails_admin.rb')} config/initializers/rails_admin.rb"
run "cp #{source.join('htaccess')} public/.htaccess"
run "cp #{source.join('asset_packages.yml')} config/asset_packages.yml"
run "cp #{source.join('evergreen.rb')} config/evergreen.rb"
run "cp #{source.join('grid.png')} public/images/grid.png"

create_file 'config/deploy.rb', <<-DEPLOY
application = '#{app_name}'
repository = ''
hosts = %w()
DEPLOY

append_file 'Rakefile', <<-METRIC_FU

MetricFu::Configuration.run do |config|
  config.rcov[:rcov_opts] << "-Ispec"
end rescue nil
METRIC_FU

append_file 'config/environment.rb', <<-ASSET_PACKAGER

  Synthesis::AssetPackage.merge_environments = %w(staging production)
ASSET_PACKAGER

run "mkdir -p app/coffeescripts spec/javascripts spec/javascripts/templates tmp"
run "touch tmp/.gitkeep"
run "chmod u+x build.sh"

git :add => '.'
git :add => 'public/javascripts/rails.js --force'
git :commit => '-am "Gems installed"'

puts "SUCCESS!"
