Before do
  def self.body
    @form.to_html
  end
  
  @result = elements do |define|
    define.forms 'form'
    define.text_field 'input[@type="text"]'
    define.submit_button 'input[@type="submit"]'
  end
end

Given /^a model for '(\w+)' with ([a-z:]+)$/ do |model_name, matches|
  attrs = matches.split(/\s+/)
  @model = build_model(model_name) do
    attrs.each { |pair| send(*pair.split(':').reverse) }
  end
end

When /^I generate a form for a new instance$/ do
  @form = SemiFormal::Builder.new(@model.new)
end

Then /^a form is generated$/ do
  @result.should have(1).form
end

Then /^the form '(\w+)' attribute is '([\w\/]+)'$/ do |name, value|
  @result.should have(1).form.with_attrs(name => value)
end

Then /^the form has a 'text field' for '(\w+)'$/ do |value|
  @result.should have(1).text_field.with_attrs(:name => "person[#{value}]")
end

Then /^the form has a submit button$/ do
  puts @result.to_html
  @result.should have(1).submit_button
end
