require 'rubygems'

task :spec do
  gem 'rspec'
  require 'rspec/core/rake_task'

  RSpec::Core::RakeTask.new(:all_specs){|t| t.spec_files = FileList['spec/**/*.rb']}
  Rake::Task[:all_specs].invoke
end