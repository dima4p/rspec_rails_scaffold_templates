# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-
# stub: rspec_rails_scaffold_templates 2.4 ruby lib

Gem::Specification.new do |s|
  s.name = "rspec_rails_scaffold_templates".freeze
  s.version = "2.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Dmitri Koulikoff".freeze]
  s.date = "2019-12-11"
  s.description = "RSpec scaffold generator templates that use FactoryGirl and WiceGrid".freeze
  s.email = "dima@koulikoff.ru".freeze
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
    "lib/rspec_rails_scaffold_templates/generators/integration_generator.rb",
    "lib/rspec_rails_scaffold_templates/generators/scaffold_generator.rb",
    "lib/rspec_rails_scaffold_templates/generators/templates/rspec/integration/request_spec.rb",
    "lib/rspec_rails_scaffold_templates/generators/templates/rspec/scaffold/api_controller_spec.rb",
    "lib/rspec_rails_scaffold_templates/generators/templates/rspec/scaffold/controller_spec.rb",
    "lib/rspec_rails_scaffold_templates/generators/templates/rspec/scaffold/edit_spec.rb",
    "lib/rspec_rails_scaffold_templates/generators/templates/rspec/scaffold/index_spec.rb",
    "lib/rspec_rails_scaffold_templates/generators/templates/rspec/scaffold/new_spec.rb",
    "lib/rspec_rails_scaffold_templates/generators/templates/rspec/scaffold/show_spec.rb",
    "rspec_rails_scaffold_templates.gemspec",
    "spec/rspec_rails_scaffold_templates_spec.rb",
    "spec/spec_helper.rb"
  ]
  s.homepage = "http://github.com/dima4p/rspec_rails_scaffold_templates".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "3.0.3".freeze
  s.summary = "RSpec scaffold generator templates that use FactoryGirl and WiceGrid".freeze

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rspec>.freeze, ["~> 3.1"])
      s.add_development_dependency(%q<rdoc>.freeze, ["~> 4.1"])
      s.add_development_dependency(%q<bundler>.freeze, ["~> 1.6"])
      s.add_development_dependency(%q<jeweler>.freeze, ["~> 2.0"])
      s.add_development_dependency(%q<simplecov>.freeze, ["~> 0.0"])
    else
      s.add_dependency(%q<rspec>.freeze, ["~> 3.1"])
      s.add_dependency(%q<rdoc>.freeze, ["~> 4.1"])
      s.add_dependency(%q<bundler>.freeze, ["~> 1.6"])
      s.add_dependency(%q<jeweler>.freeze, ["~> 2.0"])
      s.add_dependency(%q<simplecov>.freeze, ["~> 0.0"])
    end
  else
    s.add_dependency(%q<rspec>.freeze, ["~> 3.1"])
    s.add_dependency(%q<rdoc>.freeze, ["~> 4.1"])
    s.add_dependency(%q<bundler>.freeze, ["~> 1.6"])
    s.add_dependency(%q<jeweler>.freeze, ["~> 2.0"])
    s.add_dependency(%q<simplecov>.freeze, ["~> 0.0"])
  end
end

