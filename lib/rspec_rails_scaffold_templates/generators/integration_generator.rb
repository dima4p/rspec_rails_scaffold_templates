require 'generators/rspec'
require 'rails/generators/resource_helpers'

module Rspec
  module Generators
    class IntegrationGenerator < Base
      include ::Rails::Generators::ResourceHelpers
      source_paths.unshift File::expand_path('../templates/rspec/integration', __FILE__)
    end
  end
end
