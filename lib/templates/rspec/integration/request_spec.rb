<% if File.exist?(File.join %w[spec rails_helper.rb]) -%>
require 'rails_helper'
<% else -%>
require 'spec_helper'
<% end -%>

describe "<%= class_name.pluralize %>", type: :request do
<% if method = Rails.application.config.generators.options[:rails][:cancan] -%>
<% method = 'current_user' unless Symbol === method -%>
  before :each do
    allow_any_instance_of(<%= class_name.pluralize %>Controller).to receive(:<%=method%>).and_return(<%=method%>)
  end

<% end -%>
  describe "GET /<%= table_name %>" do
    it "works! (now write some real specs)" do
      get <%= index_helper %>_path
      # expect(response).to have_http_status(200)
    end
  end
end
