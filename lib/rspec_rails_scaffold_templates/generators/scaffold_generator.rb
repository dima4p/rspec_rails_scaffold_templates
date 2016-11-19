require 'generators/rspec'
require 'rails/generators/resource_helpers'

module Rspec
  module Generators
    class ScaffoldGenerator < Base
      include ::Rails::Generators::ResourceHelpers
      source_paths.unshift File::expand_path('../templates/rspec/scaffold', __FILE__)

      class_option :with_api, type: :boolean,
                        desc: "Generates also API controller in 'app/contorllers/api'"
      class_option :api_version, type: :string,
                        desc: "Adds specified path as version to 'app/contorllers/api'"

      def generate_api_controller_spec
        return unless options[:controller_specs]
        return unless options[:with_api]

        path = [
          'spec/controllers/api',
          options[:api_version],
          controller_class_path,
          "#{controller_file_name}_controller_spec.rb"
        ].compact
        template_file = File.join *path
        template 'api_controller_spec.rb', template_file
      end
    end
  end
end
