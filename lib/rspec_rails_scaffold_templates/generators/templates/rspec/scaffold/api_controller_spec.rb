<% if File.exist?(File.join %w[spec rails_helper.rb]) -%>
require 'rails_helper'
<% else -%>
require 'spec_helper'
<% end -%>

<% module_namespacing do -%>
describe Api::<%= options[:api_version].camelcase + '::' if options[:api_version].present? %><%= controller_class_name %>Controller, <%= type_metatag(:controller) %> do
<% if method = Rails.application.config.generators.options[:rails][:cancan] -%>
<% method = 'current_user' unless Symbol === method -%>
  before :each do
    allow(controller).to receive(:<%=method%>).and_return(<%=method%>)
  end

<% end -%>
  # This should return the minimal set of attributes required to create a valid
  # <%= class_name %>. As you add validations to <%= class_name %>, be sure to
  # adjust the attributes here as well. The list could not be empty.
<% links = attributes.select{|a| [:belongs_to, :references].include? a.type} -%>
<% attribute = (attributes - links).detect{|a| a.name == 'name' || a.name == 'title' || a.name == 'code' || a.name =~ /name/ || a.name =~ /title/} || attributes.first -%>
<% attribute_name = attribute.respond_to?(:column_name) ? attribute.column_name : attribute.name -%>
<% if Rails.application.config.generators.options[:rails][:fixture_replacement] == :factory_girl -%>
<% factory_girl = true -%>
  let(:<%= file_name %>) {create :<%= file_name %>}

<% if links.present? -%>
  let(:valid_attributes) do
    FactoryGirl.attributes_for(:<%=file_name%>)
      .slice(*%w[<%= attribute_name %>].map(&:to_sym))
      .merge(
<% links.each do |relation| -%>
        <%= relation.name %>_id: create(:<%= relation.name %>).id,
<% end -%>
      )
  end
<% else -%>
  let(:valid_attributes) {FactoryGirl.attributes_for(:<%=file_name%>).slice *%w[<%= attribute_name %>].map(&:to_sym)}
<% end -%>
<% else -%>
<% factory_girl = false -%>
  let(:<%= file_name %>) {<%= class_name %>.create! valid_attributes}

  let(:valid_attributes) do
    skip("Add a hash of attributes valid for your model")
  end
<% end -%>

  let(:invalid_attributes) do
    # {<%= attribute_name %>: ''}
    skip("Add a hash of attributes invalid for your model")
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # <%= controller_class_name %>Controller. Be sure to keep this updated too.
  let(:valid_session) { {} }

<% unless options[:singleton] -%>
  describe "GET #index" do
    it "assigns all <%= table_name.pluralize %> as @<%= table_name.pluralize %>" do
      <%= file_name %>
<% if RUBY_VERSION < '1.9.3' -%>
      get :index, {}, valid_session
<% else -%>
      get :index, params: {}, session: valid_session
<% end -%>
      expect(assigns(:<%= table_name %>)).to be_kind_of(ActiveRecord::Relation)
      expect(assigns(:<%= table_name %>)).to eq([<%= file_name %>])
    end
  end

<% end -%>
  describe "GET #show" do
    it "assigns the requested <%= ns_file_name %> as @<%= ns_file_name %>" do
<% if RUBY_VERSION < '1.9.3' -%>
      get :show, {:id => <%= file_name %>.to_param}, valid_session
<% else -%>
      get :show,
          params: {id: <%= file_name %>.to_param},
          session: valid_session
<% end -%>
      expect(assigns(:<%= ns_file_name %>)).to eq(<%= file_name %>)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new <%= class_name %>" do
        expect do
<% if RUBY_VERSION < '1.9.3' -%>
          post :create, {:<%= ns_file_name %> => valid_attributes}, valid_session
<% else -%>
          post :create,
              params: {<%= ns_file_name %>: valid_attributes},
              session: valid_session
<% end -%>
        end.to change(<%= class_name %>, :count).by(1)
      end

      it "assigns a newly created <%= ns_file_name %> as @<%= ns_file_name %>" do
<% if RUBY_VERSION < '1.9.3' -%>
        post :create, {:<%= ns_file_name %> => valid_attributes}, valid_session
<% else -%>
        post :create,
            params: {<%= ns_file_name %>: valid_attributes},
            session: valid_session
<% end -%>
        expect(assigns(:<%= ns_file_name %>)).to be_a(<%= class_name %>)
        expect(assigns(:<%= ns_file_name %>)).to be_persisted
      end

      it 'returns the "created" status' do
<% if RUBY_VERSION < '1.9.3' -%>
        post :create, {:<%= ns_file_name %> => valid_attributes}, valid_session
<% else -%>
        post :create,
            params: {<%= ns_file_name %>: valid_attributes},
            session: valid_session
<% end -%>
        expect(response).to have_http_status :created
      end
    end   # with valid params

    context "with invalid params" do
      it "assigns a newly created but unsaved <%= ns_file_name %> as @<%= ns_file_name %>" do
        # allow_any_instance_of(<%= class_name %>).to receive(:save).and_return(false)
<% if RUBY_VERSION < '1.9.3' -%>
        post :create, {:<%= ns_file_name %> => invalid_attributes}, valid_session
<% else -%>
        post :create,
            params: {<%= ns_file_name %>: invalid_attributes},
            session: valid_session
<% end -%>
        expect(assigns(:<%= ns_file_name %>)).to be_a_new(<%= class_name %>)
      end

      it 'returns the "unprocessable_entity" status' do
        # allow_any_instance_of(<%= class_name %>).to receive(:save).and_return(false)
<% if RUBY_VERSION < '1.9.3' -%>
        post :create, {:<%= ns_file_name %> => invalid_attributes}, valid_session
<% else -%>
        post :create,
            params: {<%= ns_file_name %>: invalid_attributes},
            session: valid_session
<% end -%>
        expect(response).to have_http_status :unprocessable_entity
      end
    end   # with invalid params
  end   # POST #create

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) { {<%= attribute_name %>: 'New value'} }

      it "updates the requested <%= ns_file_name %>" do
        # expect_any_instance_of(<%= class_name %>)
        #   .to receive(:update).with(new_attributes.inject({}){|_, (k, v)| _[k] = v.to_s; _})
<% if RUBY_VERSION < '1.9.3' -%>
        put :update,
            {:id => <%= file_name %>.to_param, :<%= ns_file_name %> => new_attributes},
            valid_session
<% else -%>
        put :update,
            params: {id: <%= file_name %>.to_param,
                     <%= ns_file_name %>: new_attributes},
            session: valid_session
<% end -%>
        <%= file_name %>.reload
        # skip("Add assertions for updated state")
        expect(<%= file_name %>.<%= attribute_name %>).to eq 'New value'
      end

      it "assigns the requested <%= ns_file_name %> as @<%= ns_file_name %>" do
<% if RUBY_VERSION < '1.9.3' -%>
        put :update,
            {:id => <%= file_name %>.to_param, :<%= ns_file_name %> => valid_attributes},
            valid_session
<% else -%>
        put :update,
            params: {id: <%= file_name %>.to_param,
                     <%= ns_file_name %>: valid_attributes},
            session: valid_session
<% end -%>
        expect(assigns(:<%= ns_file_name %>)).to eq(<%= file_name %>)
      end

      it 'returns the "OK" status' do
<% if RUBY_VERSION < '1.9.3' -%>
        put :update,
            {:id => <%= file_name %>.to_param, :<%= ns_file_name %> => valid_attributes},
            valid_session
<% else -%>
        put :update,
            params: {id: <%= file_name %>.to_param,
                     <%= ns_file_name %>: valid_attributes},
            session: valid_session
<% end -%>
        expect(response).to have_http_status :ok
      end
    end  # with valid params

    context "with invalid params" do
      it "assigns the <%= ns_file_name %> as @<%= ns_file_name %>" do
        # allow_any_instance_of(<%= class_name %>).to receive(:update).and_return(false)
<% if RUBY_VERSION < '1.9.3' -%>
        put :update,
            {:id => <%= file_name %>.to_param, :<%= ns_file_name %> => invalid_attributes},
            valid_session
<% else -%>
        put :update,
            params: {id: <%= file_name %>.to_param,
                     <%= ns_file_name %>: invalid_attributes},
            session: valid_session
<% end -%>
        expect(assigns(:<%= ns_file_name %>)).to eq(<%= file_name %>)
      end

      it 'returns the "unprocessable_entity" status' do
        # allow_any_instance_of(<%= class_name %>).to receive(:update).and_return(false)
<% if RUBY_VERSION < '1.9.3' -%>
        put :update,
            {:id => <%= file_name %>.to_param, :<%= ns_file_name %> => invalid_attributes},
            valid_session
<% else -%>
        put :update,
            params: {id: <%= file_name %>.to_param,
                     <%= ns_file_name %>: invalid_attributes},
            session: valid_session
<% end -%>
        expect(response).to have_http_status :unprocessable_entity
      end
    end   # with invalid params
  end   # PUT #update

  describe "DELETE #destroy" do
    it "destroys the requested <%= ns_file_name %>" do
      <%= file_name %>
      expect do
<% if RUBY_VERSION < '1.9.3' -%>
        delete :destroy, {:id => <%= file_name %>.to_param}, valid_session
<% else -%>
        delete :destroy,
            params: {id: <%= file_name %>.to_param},
            session: valid_session
<% end -%>
      end.to change(<%= class_name %>, :count).by(-1)
    end

    it 'returns the "no_content" status' do
      <%= file_name %>
<% if RUBY_VERSION < '1.9.3' -%>
      delete :destroy, {:id => <%= file_name %>.to_param}, valid_session
<% else -%>
      delete :destroy,
          params: {id: <%= file_name %>.to_param},
          session: valid_session
<% end -%>
      expect(response).to have_http_status :no_content
    end
  end   # DELETE #destroy

end
<% end -%>
