<% if File.exist?(File.join %w[spec rails_helper.rb]) -%>
require 'rails_helper'
<% else -%>
require 'spec_helper'
<% end -%>

<% output_attributes = attributes.reject{|attribute| [:created_at, :deleted_at, :updated_at].index(attribute.name) or attribute.password_digest? } -%>
describe "<%= ns_table_name %>/index", type: :view do
  before(:each) do
<% if Rails.application.config.generators.options[:rails][:cancan] -%>
    allow(controller).to receive(:can?).and_return(true)
<% end -%>
<% if options[:fixture_replacement] == :factory_girl -%>
  # options[:fixture_replacement] == :factory_girl
<% end -%>
<% if Rails.application.config.generators.options[:rails][:fixture_replacement] == :factory_girl -%>
    @<%= ns_file_name %> = create(:<%= ns_file_name %>)
<% else # no factory_girl -%>
    <%= class_name %>.create(<%= output_attributes.empty? ? ')' : '' %>
<% output_attributes.each_with_index do |attribute, attribute_index| -%>
      <%= attribute.name %>: <%= value_for(attribute) %><%= attribute_index == output_attributes.length - 1 ? '' : ','%>
<% end -%>
<% if !output_attributes.empty? -%>
    )
<% end -%>
<% end -%>
    assign :<%= table_name %>, <%= class_name %>.all
  end

  it "renders a list of <%= table_name %>" do
    render

<% for attribute in output_attributes -%>
<% if Rails.application.config.generators.options[:rails][:fixture_replacement] == :factory_girl -%>
<% if attribute.reference? -%>
    assert_select 'tr>td', text: @<%= ns_file_name %>.<%= attribute.name %>.name, count: 1
<% else -%>
    assert_select 'tr>td', text: @<%= ns_file_name %>.<%= attribute.name %>.to_s, count: 1
<% end -%>
<% else -%>
    assert_select "tr>td", text: <%= value_for(attribute) %>.to_s, count: 1
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
    assert_select 'tr>td', text: @<%= ns_file_name %>.<%= attribute.name %>.name, count: 1
<% else -%>
    assert_select 'tr>td', text: @<%= ns_file_name %>.<%= attribute.name %>.to_s, count: 1
<% end -%>
<% else -%>
    assert_select "tr>td", text: <%= value_for(attribute) %>.to_s, count: 1
<% end -%>
<% end -%>
  end
<% end -%>
end
