require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

<% module_namespacing do -%>
describe "/<%= name.underscore.pluralize %>", <%= type_metatag(:request) %> do
<% if method = Rails.application.config.generators.options[:rails][:cancan] -%>
<% method = 'current_user' unless Symbol === method -%>
  before :each do
    allow_any_instance_of(<%= controller_class_name %>Controller).to receive(:<%=method%>)
        .and_return(<%=method%>)
<% if options[:cancan] -%>
    allow_any_instance_of(Ability).to receive(:can?).and_return true
<% end -%>
  end

<% end -%>
  # This should return the minimal set of attributes required to create a valid
  # <%= class_name %>. As you add validations to <%= class_name %>, be sure to
  # adjust the attributes here as well. The list could not be empty.
<% links = attributes.select{|a| [:belongs_to, :references].include? a.type} -%>
<% attribute = (attributes - links).detect{|a| a.name == 'name' || a.name == 'title' || a.name == 'code' || a.name =~ /name/ || a.name =~ /title/} || attributes.first -%>
<% attribute_name = attribute.respond_to?(:column_name) ? attribute.column_name : attribute.name -%>
<% if Rails.application.config.generators.options[:rails][:fixture_replacement] == :factory_bot -%>
<% factory_bot = true -%>
  let(:<%= file_name %>) {create :<%= file_name %>}

<% if links.present? -%>
  let(:valid_attributes) do
    attributes_for(:<%=file_name%>)
      .slice(*%i[<%= attribute_name %>])
      .merge(
<% links.each do |relation| -%>
        <%= relation.name %>_id: create(:<%= relation.name %>).id,
<% end -%>
      )
  end
<% else -%>
  let(:valid_attributes) {attributes_for(:<%=file_name%>).slice *%i[<%= attribute_name %>]}
<% end -%>
<% else -%>
<% factory_bot = false -%>
  let(:<%= file_name %>) {<%= class_name %>.create! valid_attributes}

  let(:valid_attributes) do
    skip("Add a hash of attributes valid for your model")
  end
<% end -%>

  let(:invalid_attributes) do
    # {<%= attribute_name %>: ''}
    skip("Add a hash of attributes invalid for your model")
  end

  # This should return the minimal set of values that should be in the headers
  # in order to pass any filters (e.g. authentication) defined in
  # <%= controller_class_name %>Controller, or in your router and rack
  # middleware. Be sure to keep this updated too.
  let(:valid_headers) do
    {}
  end

<% unless options[:singleton] -%>
  describe "GET /index" do
    subject(:get_index) do
      get <%= index_helper %>_url, headers: valid_headers, as: :json
    end

    it "renders a successful response" do
      <%= class_name %>.create! valid_attributes
      get_index
      expect(response).to be_successful
    end
  end
<% end -%>

  describe "GET /show" do
    subject(:get_show) do
      get <%= file_name %>_url(id: <%= file_name %>.to_param),
          headers: valid_headers, as: :json
    end

    it "renders a successful response" do
<% unless factory_bot -%>
      <%= file_name %> = <%= class_name %>.create! valid_attributes
<% end -%>
      get_show
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    subject(:post_create) do
      post <%= index_helper %>_url, params: { <%= ns_file_name %>: attributes },
          headers: valid_headers, as: :json
    end

    context "with valid parameters" do
      let(:attributes) {valid_attributes}

      it "creates a new <%= class_name %>" do
        expect{post_create}.to change(<%= class_name %>, :count).by(1)
      end

      it "renders a JSON response with the new <%= singular_table_name %>" do
        post_create
        expect(response.content_type).to match(a_string_including("application/json"))
      end

      it "returns http_status :created" do
        post_create
        expect(response).to have_http_status(:created)
      end
    end

    context "with invalid parameters" do
      let(:attributes) {invalid_attributes}

      it "does not create a new <%= class_name %>" do
        expect {post_create}.not_to change(<%= class_name %>, :count)
      end

      it "returns http_status :unprocessable_entity" do
        post_create
        expect(response).to have_http_status :unprocessable_entity
      end

      it "renders a JSON response with errors for the new <%= singular_table_name %>" do
        post_create
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
  end

  describe "PATCH /update" do
    subject(:patch_update) do
      patch <%= file_name %>_url(id: <%= file_name %>.to_param),
          params: { <%= singular_table_name %>: attributes },
          headers: valid_headers, as: :json
    end

    context "with valid parameters" do
      let(:attributes) { {<%= attribute_name %>: 'New value'} }

      it "updates the requested <%= ns_file_name %>" do
        # expect_any_instance_of(<%= class_name %>)
        #   .to receive(:update).with(attributes.inject({}){|_, (k, v)| _[k] = v.to_s; _})
<% unless factory_bot -%>
        <%= file_name %> = <%= class_name %>.create! valid_attributes
<% end -%>
        patch_update
        <%= file_name %>.reload
        # skip("Add assertions for updated state")
        expect(<%= file_name %>.<%= attribute_name %>).to eq 'New value'
      end

      it "renders a JSON response with the <%= singular_table_name %>" do
<% unless factory_bot -%>
        <%= file_name %> = <%= class_name %>.create! valid_attributes
<% end -%>
        patch_update
        expect(response.content_type).to match(a_string_including("application/json"))
      end

      it "returns http_status :ok" do
        patch_update
        expect(response).to have_http_status(:ok)
      end
    end

    context "with invalid parameters" do
      let(:attributes) {invalid_attributes}

      it "returns http_status :unprocessable_entity" do
<% unless factory_bot -%>
        <%= file_name %> = <%= class_name %>.create! valid_attributes
<% end -%>
        patch_update
        expect(response).to have_http_status :unprocessable_entity
      end

      it "renders a JSON response with errors for the <%= singular_table_name %>" do
<% unless factory_bot -%>
        <%= file_name %> = <%= class_name %>.create! valid_attributes
<% end -%>
        patch_update
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
  end

  describe "DELETE /destroy" do
    subject(:delete_destroy) {delete <%= file_name %>_url(id: <%= file_name %>.to_param)}

    it "destroys the requested <%= ns_file_name %>" do
<% if factory_bot -%>
      <%= file_name %>
<% else -%>
      <%= file_name %> = <%= class_name %>.create! valid_attributes
<% end -%>
      expect {delete_destroy}.to change(<%= class_name %>, :count).by(-1)
    end

    it "returns http_status :no_content" do
      delete_destroy
      expect(response).to have_http_status(:no_content)
    end
  end
end
<% end -%>
