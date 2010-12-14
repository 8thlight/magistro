require 'rubygems'

task :spec do
  gem 'rspec'
  require 'rspec/core/rake_task'
  RSpec::Core::RakeTask.new(:all_specs)
  Rake::Task[:all_specs].invoke
end