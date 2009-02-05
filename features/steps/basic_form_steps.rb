Before do
  def self.body
    @form.to_html
  end
  
  @result = elements do |define|
    define.forms 'form'
    define.text_fields 'input[@type="text"]'
    define.hidden_fields 'input[@type="hidden"]'
    define.submit_button 'input[@type="submit"]'
    define.text_areas 'textarea'
  end
end

Given /^a model for '(\w+)' with ([a-z:\s_]+)$/ do |model_name, matches|
  attrs = matches.split(/\s+/)
  @model = build_model(model_name) do
    keys = attrs.each do |pair|
      key, value = *pair.split(':').reverse
      send(key, value)
      attr_accessible value
    end
  end
end

Given /^(.*) belongs to (.*)$/ do |child, parent|
  child.constantize.belongs_to parent.downcase.to_sym
end

Given /^I save a (.*) with ([\w\s\d]+)$/ do |model, matches|
  attrs = Hash[*matches.gsub(/and/, '').split(/\s+/)]
  @record = model.constantize.create!(attrs)
end

When /^I generate a form for a new (.*)$/ do |model|
  @form = SemiFormal::Builder.new(model.constantize.new)
end

When /^I generate a form for the first ([^\s]*)( with parent (.*))?$/ do |model, hv, parent|
  args = []
  args << (@record = model.constantize.first)
  args.unshift @record.send(parent) if hv
  @form = SemiFormal::Builder.new(args)
end

Then /^a form is generated$/ do
  @result.should have(1).form
end

Then /^the form '(\w+)' attribute is '([\w\/]+)'$/ do |name, value|
  @result.should have(1).form.with_attrs(name => value)
end

Then /^the form has (\d+) '([\w\s]+)' for '([\w\[\]]+)'( with value '(\w+)')?/ do |count, field_type, field_name, hv, value|
  field_type.gsub!(/\s/, '_')
  @result.should have(count.to_i).send("#{field_type}").with_attrs(:name => field_name)
  @result.should have(count.to_i).send("#{field_type}").with_attrs(:value => value) if value
end

Then /^the form has a submit button$/ do
  @result.should have(1).submit_button
end

