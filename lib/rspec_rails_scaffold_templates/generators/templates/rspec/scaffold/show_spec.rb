<% if File.exist?(File.join %w[spec rails_helper.rb]) -%>
require 'rails_helper'
<% else -%>
require 'spec_helper'
<% end -%>

<% output_attributes = attributes.reject{|attribute| [:created_at, :deleted_at, :updated_at].index(attribute.name) or attribute.password_digest? } -%>
describe "<%= ns_table_name %>/show", <%= type_metatag(:view) %> do
<% if Rails.application.config.generators.options[:rails][:fixture_replacement] == :factory_girl -%>
  let(:<%= ns_file_name %>) {create :<%= ns_file_name %>}
<% else -%>
  let(:<%= ns_file_name %>) do
    <%= class_name %>.create!(<%= ')' if output_attributes.empty? %>
<% output_attributes.each_with_index do |attribute, attribute_index| -%>
      <%= attribute.name %>: <%= value_for(attribute) %><%= attribute_index == output_attributes.length - 1 ? '' : ','%>
<% end -%>
<% if !output_attributes.empty? -%>
    )
<% end -%>
  end
<% end -%>

  before(:each) do
<% if Rails.application.config.generators.options[:rails][:cancan] -%>
    allow(controller).to receive(:can?).and_return(true)
<% end -%>
    assign :<%= ns_file_name %>, <%= ns_file_name %>
  end

  it "renders attributes in dl>dd" do
    render
<% for attribute in output_attributes -%>
<% if Rails.application.config.generators.options[:rails][:fixture_replacement] == :factory_girl -%>
<% if attribute.reference? -%>
    assert_select 'dl>dd', text: Regexp.new(<%= ns_file_name %>.<%= attribute.name %>.name)
<% else -%>
    assert_select 'dl>dd', text: Regexp.new(<%= ns_file_name %>.<%= attribute.name %>.to_s)
<% end -%>
<% else -%>
    assert_select 'dl>dd', text: <%= value_for(attribute) %>
<% end -%>
<% end -%>
  end
end
