# encoding: utf-8

require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'

require 'jeweler'
Jeweler::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://guides.rubygems.org/specification-reference/ for more options
  gem.name = "rspec_rails_scaffold_templates"
  gem.homepage = "http://github.com/dima4p/rspec_rails_scaffold_templates"
  gem.license = "MIT"
  gem.summary = %Q{RSpec scaffold generator templates that use FactoryGirl and WiceGrid}
  gem.description = %Q{RSpec scaffold generator templates that use FactoryGirl and WiceGrid}
  gem.email = "dimitri@kulk.eu"
  gem.authors = ["Dimitri Kulk"]
  gem.version = File.exist?('VERSION') ? File.read('VERSION') : ""
  # dependencies defined in Gemfile
end
Jeweler::RubygemsDotOrgTasks.new

require 'rspec/core'
require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec) do |spec|
  spec.pattern = FileList['spec/**/*_spec.rb']
end

desc "Code coverage detail"
task :simplecov do
  ENV['COVERAGE'] = "true"
  Rake::Task['spec'].execute
end

task :default => :spec

require 'rdoc/task'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "rspec_rails_scaffold_templates #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
