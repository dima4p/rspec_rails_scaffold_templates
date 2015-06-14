<% if File.exist?(File.join %w[spec rails_helper.rb]) -%>
require 'rails_helper'
<% else -%>
require 'spec_helper'
<% end -%>

describe "<%= class_name.pluralize %>", type: :request do
<% if Rails.application.config.generators.options[:rails][:cancan] -%>
  before :each do
    allow_any_instance_of(<%= class_name.pluralize %>Controller).to receive(:current_user).and_return(current_user)
  end

<% end -%>
  describe "GET /<%= table_name %>" do
    it "works! (now write some real specs)" do
      get <%= index_helper %>_path
      # expect(response).to have_http_status(200)
    end
  end
end
