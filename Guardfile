# A sample Guardfile
# More info at https://github.com/guard/guard#readme

guard 'bundler' do
  watch('Gemfile')
end

guard 'spork', :bundler => false, :wait => 120 do
  watch('Gemfile')
  watch('config/application.rb')
  watch('config/environment.rb')
  watch(%r{^config/environments/.*\.rb$})
  watch(%r{^config/initializers/.*\.rb$})
  watch('spec/spec_helper.rb')
end

# Set :bunder => false will make specs run even faster.
guard 'rspec', :bundler => false, :version => 2, :cli => '--drb' do
  watch(%r{^spec/(.*)_spec\.rb})
  watch(%r{^lib/(.*)\.rb})                                { |m| "spec/lib/#{m[1]}_spec.rb" }
  watch(%r{^spec/spec_helper\.rb})                        { 'spec' }

  # Rails example
  watch(%r{^app/(.*)\.rb})                                { |m| "spec/#{m[1]}_spec.rb" }
  watch(%r{^config/routes\.rb})                           { 'spec/routing' }
  watch(%r{^app/controllers/application_controller\.rb})  { 'spec/controllers' }
  watch(%r{^spec/support/factories/(.*)\.rb})             { 'spec/models' }
  watch(%r{^spec/acceptance/support/.*\.rb})              { 'spec/acceptance' }
end

# vim: set ft=ruby:
