<% if File.exist?(File.join %w[spec rails_helper.rb]) -%>
require 'rails_helper'
<% else -%>
require 'spec_helper'
<% end -%>

<% output_attributes = attributes.reject{|attribute| [:created_at, :deleted_at, :updated_at].index(attribute.name) or attribute.password_digest? } -%>
describe "<%= ns_table_name %>/index", type: :view do
  before(:each) do
    allow(controller).to receive(:can?).and_return(true)
<% if options[:fixture_replacement] == :factory_girl -%>
  # options[:fixture_replacement] == :factory_girl
<% end -%>
<% if Rails.application.config.generators.options[:rails][:fixture_replacement] == :factory_girl -%>
<% size = 1 -%>
    @<%= ns_file_name %> = create(:<%= ns_file_name %>)
<% if not defined? Wice::WiceGrid -%>
    assign(:<%= table_name %>, [@<%= ns_file_name %>, @<%= ns_file_name %>])
<% end -%>
<% else -%>
<% size = 2 -%>
<% if defined? Wice::WiceGrid -%>
    result_set = assign(:<%= table_name %>, [
<% else -%>
    assign(:<%= table_name %>, [
<% end -%>
      # if you got an exception here add gem 'rspec-activemodel-mocks' to your Gemfile
<% [1,2].each_with_index do |id, model_index| -%>
      <%= class_name %>.create(<%= output_attributes.empty? ? (model_index == 1 ? ')' : '),') : '' %>
<% output_attributes.each_with_index do |attribute, attribute_index| -%>
        :<%= attribute.name %> => <%= value_for(attribute) %><%= attribute_index == output_attributes.length - 1 ? '' : ','%>
<% end -%>
<% if !output_attributes.empty? -%>
      <%= model_index == 1 ? ')' : '),' %>
<% end -%>
<% end -%>
    ])
<% end -%>
  end

  it "renders a list of <%= table_name %>" do
<% if defined? Wice::WiceGrid -%>
    assign :<%= table_name %>, [@<%= ns_file_name %>]
<% end -%>
    render

<% for attribute in output_attributes -%>
<% if Rails.application.config.generators.options[:rails][:fixture_replacement] == :factory_girl -%>
<% if attribute.reference? -%>
    assert_select 'tr>td', text: @<%= ns_file_name %>.<%= attribute.name %>.name, count: <%= size %>
<% else -%>
    assert_select 'tr>td', text: @<%= ns_file_name %>.<%= attribute.name %>.to_s, count: <%= size %>
<% end -%>
<% else -%>
    assert_select "tr>td", :text => <%= value_for(attribute) %>.to_s, :count => <%= size %>
<% end -%>
<% end -%>
  end

<% if defined? Wice::WiceGrid -%>
  it "renders a list of <%= table_name %> in WiceGrid" do
    assign :grid, Wice::WiceGrid.new(<%= class_name %>, controller)
    render

<% for attribute in output_attributes -%>
<% if Rails.application.config.generators.options[:rails][:fixture_replacement] == :factory_girl -%>
<% if attribute.reference? -%>
    assert_select 'tr>td', text: @<%= ns_file_name %>.<%= attribute.name %>.name, count: <%= size %>
<% else -%>
    assert_select 'tr>td', text: @<%= ns_file_name %>.<%= attribute.name %>.to_s, count: <%= size %>
<% end -%>
<% else -%>
    assert_select "tr>td", :text => <%= value_for(attribute) %>.to_s, :count => <%= size %>
<% end -%>
<% end -%>
  end
<% end -%>
end
