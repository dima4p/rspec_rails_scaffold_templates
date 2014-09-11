require 'spec_helper'

describe "<%= class_name.pluralize %>" do
  before :each do
    allow_any_instance_of(<%= class_name.pluralize %>Controller).to receive(:current_user).and_return(current_user)
  end

  describe "GET /<%= table_name %>" do
    it "works! (now write some real specs)" do
      get <%= index_helper %>_path
      # expect(response.status).to have_http_status(200)
    end
  end
end
