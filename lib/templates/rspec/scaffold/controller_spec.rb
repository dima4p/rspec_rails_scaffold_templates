<% if File.exist?(File.join %w[spec rails_helper.rb]) -%>
require 'rails_helper'
<% else -%>
require 'spec_helper'
<% end -%>

<% module_namespacing do -%>
describe <%= controller_class_name %>Controller, type: :controller do

  before :each do
    allow(controller).to receive(:current_user).and_return(current_user)
  end

  # This should return the minimal set of attributes required to create a valid
  # <%= class_name %>. As you add validations to <%= class_name %>, be sure to
  # adjust the attributes here as well. The list could not be empty.
<% if Rails.application.config.generators.options[:rails][:fixture_replacement] == :factory_girl -%>
<% factory_girl = true -%>
<% attribute = attributes.detect{|a| attributes.detect{|a| a.name == 'name'} || attributes.detect{|a| a.name == 'title'} || attributes.first} -%>
<% attribute_name = attribute.respond_to?(:column_name) ? attribute.column_name : attribute.name -%>
  let(:valid_attributes) {FactoryGirl.build(:<%=file_name%>).attributes.slice *%w[<%= attribute_name %>]}
<% else -%>
<% factory_girl = false -%>
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }
<% end -%>

  let(:invalid_attributes) do
    skip("Add a hash of attributes invalid for your model")
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # <%= controller_class_name %>Controller. Be sure to keep this updated too.
  let(:valid_session) { {} }

<% unless options[:singleton] -%>
  describe "GET index" do
    it "assigns all <%= table_name.pluralize %> as @<%= table_name.pluralize %>" do
<% if factory_girl -%>
      <%= file_name %> = create :<%= file_name %>
<% else -%>
      <%= file_name %> = <%= class_name %>.create! valid_attributes
<% end -%>
      get :index, {}, valid_session
      expect(assigns(:<%= table_name %>)).to be_kind_of(ActiveRecord::Relation)
      expect(assigns(:<%= table_name %>)).to eq([<%= file_name %>])
    end
  end

<% end -%>
  describe "GET show" do
    it "assigns the requested <%= ns_file_name %> as @<%= ns_file_name %>" do
<% if factory_girl -%>
      <%= file_name %> = create :<%= file_name %>
<% else -%>
      <%= file_name %> = <%= class_name %>.create! valid_attributes
<% end -%>
      get :show, {id: <%= file_name %>.to_param}, valid_session
      expect(assigns(:<%= ns_file_name %>)).to eq(<%= file_name %>)
    end
  end

  describe "GET new" do
    it "assigns a new <%= ns_file_name %> as @<%= ns_file_name %>" do
      get :new, {}, valid_session
      expect(assigns(:<%= ns_file_name %>)).to be_a_new(<%= class_name %>)
    end
  end

  describe "GET edit" do
    it "assigns the requested <%= ns_file_name %> as @<%= ns_file_name %>" do
<% if factory_girl -%>
      <%= file_name %> = create :<%= file_name %>
<% else -%>
      <%= file_name %> = <%= class_name %>.create! valid_attributes
<% end -%>
      get :edit, {id: <%= file_name %>.to_param}, valid_session
      expect(assigns(:<%= ns_file_name %>)).to eq(<%= file_name %>)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new <%= class_name %>" do
        expect do
          post :create, {<%= ns_file_name %>: valid_attributes}, valid_session
        end.to change(<%= class_name %>, :count).by(1)
      end

      it "assigns a newly created <%= ns_file_name %> as @<%= ns_file_name %>" do
        post :create, {<%= ns_file_name %>: valid_attributes}, valid_session
        expect(assigns(:<%= ns_file_name %>)).to be_a(<%= class_name %>)
        expect(assigns(:<%= ns_file_name %>)).to be_persisted
      end

      it "redirects to the created <%= ns_file_name %>" do
        post :create, {<%= ns_file_name %>: valid_attributes}, valid_session
        expect(response).to redirect_to(<%= class_name %>.last)
        # expect(response).to redirect_to(<%= index_helper %>_url)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved <%= ns_file_name %> as @<%= ns_file_name %>" do
        # allow_any_instance_of(<%= class_name %>).to receive(:save).and_return(false)
        post :create, {<%= ns_file_name %>: invalid_attributes}, valid_session
        expect(assigns(:<%= ns_file_name %>)).to be_a_new(<%= class_name %>)
      end

      it "re-renders the 'new' template" do
        # allow_any_instance_of(<%= class_name %>).to receive(:save).and_return(false)
        post :create, {<%= ns_file_name %>: invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end   # describe "POST create"

  describe "PUT update" do
    describe "with valid params" do
      let(:new_attributes) { {<%= attribute_name %>: 'New value'} }

      it "updates the requested <%= ns_file_name %>" do
<% if factory_girl -%>
        <%= file_name %> = create :<%= file_name %>
<% else -%>
        <%= file_name %> = <%= class_name %>.create! valid_attributes
<% end -%>
        # expect_any_instance_of(<%= class_name %>)
        #   .to receive(:update).with(new_attributes.inject({}){|_, (k, v)| _[k] = v.to_s; _})
        put :update, {id: <%= file_name %>.to_param, <%= ns_file_name %>: new_attributes}, valid_session
        <%= file_name %>.reload
        # skip("Add assertions for updated state")
        expect(<%= file_name %>.<%= attribute_name %>).to eq 'New value'
      end

      it "assigns the requested <%= ns_file_name %> as @<%= ns_file_name %>" do
<% if factory_girl -%>
        <%= file_name %> = create :<%= file_name %>
<% else -%>
        <%= file_name %> = <%= class_name %>.create! valid_attributes
<% end -%>
        put :update, {id: <%= file_name %>.to_param, <%= ns_file_name %>: valid_attributes}, valid_session
        expect(assigns(:<%= ns_file_name %>)).to eq(<%= file_name %>)
      end

      it "redirects to the <%= ns_file_name %>" do
<% if factory_girl -%>
        <%= file_name %> = create :<%= file_name %>
<% else -%>
        <%= file_name %> = <%= class_name %>.create! valid_attributes
<% end -%>
        put :update, {id: <%= file_name %>.to_param, <%= ns_file_name %>: valid_attributes}, valid_session
        expect(response).to redirect_to(<%= file_name %>)
      end
    end

    describe "with invalid params" do
      it "assigns the <%= ns_file_name %> as @<%= ns_file_name %>" do
<% if factory_girl -%>
        <%= file_name %> = create :<%= file_name %>
<% else -%>
        <%= file_name %> = <%= class_name %>.create! valid_attributes
<% end -%>
        # allow_any_instance_of(<%= class_name %>).to receive(:update).and_return(false)
        put :update, {id: <%= file_name %>.to_param, <%= ns_file_name %>: invalid_attributes}, valid_session
        expect(assigns(:<%= ns_file_name %>)).to be_a(<%= class_name %>)
      end

      it "re-renders the 'edit' template" do
<% if factory_girl -%>
        <%= file_name %> = create :<%= file_name %>
<% else -%>
        <%= file_name %> = <%= class_name %>.create! valid_attributes
<% end -%>
        # allow_any_instance_of(<%= class_name %>).to receive(:update).and_return(false)
        put :update, {id: <%= file_name %>.to_param, <%= ns_file_name %>: invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end   # describe "PUT update"

  describe "DELETE destroy" do
    it "destroys the requested <%= ns_file_name %>" do
<% if factory_girl -%>
      <%= file_name %> = create :<%= file_name %>
<% else -%>
      <%= file_name %> = <%= class_name %>.create! valid_attributes
<% end -%>
      expect do
        delete :destroy, {id: <%= file_name %>.to_param}, valid_session
      end.to change(<%= class_name %>, :count).by(-1)
    end

    it "redirects to the <%= table_name %> list" do
<% if factory_girl -%>
      <%= file_name %> = create :<%= file_name %>
<% else -%>
      <%= file_name %> = <%= class_name %>.create! valid_attributes
<% end -%>
      delete :destroy, {id: <%= file_name %>.to_param}, valid_session
      expect(response).to redirect_to(<%= index_helper %>_url)
    end
  end   # describe "DELETE destroy"

end
<% end -%>
