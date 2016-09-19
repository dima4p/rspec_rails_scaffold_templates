module RspecRailsScaffoldTemplates
  class Railtie < Rails::Railtie
    config.app_generators do |g|
      g.templates.unshift File::expand_path('../generators/templates', __FILE__)
    end

    require 'rspec_rails_scaffold_templates/generators/scaffold_generator'
  end
end
