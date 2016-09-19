# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-
# stub: rspec_rails_scaffold_templates 2.0.0 ruby lib

Gem::Specification.new do |s|
  s.name = "rspec_rails_scaffold_templates"
  s.version = "2.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Dmitri Koulikoff"]
  s.date = "2016-09-19"
  s.description = "RSpec scaffold generator templates that use FactoryGirl and WiceGrid"
  s.email = "dima@koulikoff.ru"
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.rdoc"
  ]
  s.files = [
    ".document",
    ".rspec",
    "Gemfile",
    "LICENSE.txt",
    "README.rdoc",
    "Rakefile",
    "VERSION",
    "lib/rspec_rails_scaffold_templates.rb",
    "lib/rspec_rails_scaffold_templates/generators/scaffold_generator.rb",
    "lib/rspec_rails_scaffold_templates/generators/templates/rspec/integration/request_spec.rb",
    "lib/rspec_rails_scaffold_templates/generators/templates/rspec/scaffold/api_controller_spec.rb",
    "lib/rspec_rails_scaffold_templates/generators/templates/rspec/scaffold/controller_spec.rb",
    "lib/rspec_rails_scaffold_templates/generators/templates/rspec/scaffold/edit_spec.rb",
    "lib/rspec_rails_scaffold_templates/generators/templates/rspec/scaffold/index_spec.rb",
    "lib/rspec_rails_scaffold_templates/generators/templates/rspec/scaffold/new_spec.rb",
    "lib/rspec_rails_scaffold_templates/generators/templates/rspec/scaffold/show_spec.rb",
    "lib/rspec_rails_scaffold_templates/railties.rb",
    "rspec_rails_scaffold_templates.gemspec",
    "spec/rspec_rails_scaffold_templates_spec.rb",
    "spec/spec_helper.rb"
  ]
  s.homepage = "http://github.com/dima4p/rspec_rails_scaffold_templates"
  s.licenses = ["MIT"]
  s.rubygems_version = "2.5.1"
  s.summary = "RSpec scaffold generator templates that use FactoryGirl and WiceGrid"

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rspec>, ["~> 3.1"])
      s.add_development_dependency(%q<rdoc>, ["~> 4.1"])
      s.add_development_dependency(%q<bundler>, ["~> 1.6"])
      s.add_development_dependency(%q<jeweler>, ["~> 2.0"])
      s.add_development_dependency(%q<simplecov>, ["~> 0.0"])
    else
      s.add_dependency(%q<rspec>, ["~> 3.1"])
      s.add_dependency(%q<rdoc>, ["~> 4.1"])
      s.add_dependency(%q<bundler>, ["~> 1.6"])
      s.add_dependency(%q<jeweler>, ["~> 2.0"])
      s.add_dependency(%q<simplecov>, ["~> 0.0"])
    end
  else
    s.add_dependency(%q<rspec>, ["~> 3.1"])
    s.add_dependency(%q<rdoc>, ["~> 4.1"])
    s.add_dependency(%q<bundler>, ["~> 1.6"])
    s.add_dependency(%q<jeweler>, ["~> 2.0"])
    s.add_dependency(%q<simplecov>, ["~> 0.0"])
  end
end

