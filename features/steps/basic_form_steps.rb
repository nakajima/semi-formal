Before do
  def self.body
    @form.to_html
  end
  
  @result = elements do |define|
    define.forms 'form'
    define.text_field 'input[@type="text"]'
    define.hidden_fields 'input[@type="hidden"]'
    define.submit_button 'input[@type="submit"]'
  end
end

Given /^a model for '(\w+)' with ([a-z:\s]+)$/ do |model_name, matches|
  attrs = matches.split(/\s+/)
  @model = build_model(model_name) do
    attrs.each { |pair| send(*pair.split(':').reverse) }
  end
end

Given /^I save a record with ([\w\s\d]+)$/ do |matches|
  attrs = Hash[*matches.gsub(/and/, '').split(/\s+/)]
  @record = @model.create!(attrs)
end

When /^I generate a form for a new instance$/ do
  @form = SemiFormal::Builder.new(@model.new)
end

When /^I generate a form for the first record$/ do
  @form = SemiFormal::Builder.new(@record)
end

Then /^a form is generated$/ do
  @result.should have(1).form
end

Then /^the form '(\w+)' attribute is '([\w\/]+)'$/ do |name, value|
  @result.should have(1).form.with_attrs(name => value)
end

Then /^the form has a 'text field' for '(\w+)'( with value '(\w+)')?/ do |key, hv, value|
  @result.should have(1).text_field.with_attrs(:name => "#{@model.model_name.singular}[#{key}]")
  @result.should have(1).text_field.with_attrs(:value => value) if value
end

Then /^the form has a 'hidden field' for '(\w+)'( with value '(\w+)')?/ do |key, hv, value|
  @result.should have(1).hidden_field.with_attrs(:name => key)
  @result.should have(1).hidden_field.with_attrs(:value => value) if value
end

Then /^the form has a submit button$/ do
  @result.should have(1).submit_button
end
