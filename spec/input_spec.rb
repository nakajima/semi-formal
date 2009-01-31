require 'spec/spec_helper'

describe SemiFormal::Input do
  it "takes an instance and a name" do
    instance = new_instance
    input = SemiFormal::Input.new(instance, :age)
    input.instance.should == instance
    input.name.should == :age
  end
  
  describe "call" do
    before(:each) do
      @instance = new_instance
      @input = SemiFormal::Input.new(@instance, :age)
      stub(@faker_builder = Object.new).label
    end
    
    it "takes a Nokogiri builder context" do
      @input.call(@faker_builder)
    end
    
    it "creates a label for the input" do
      mock(@faker_builder).label
      @input.call(@faker_builder)
    end
  end
  
  describe "field_type" do
    def input_for(name)
      build_model(:things) { send name, :name }
      SemiFormal::Input.new(Thing.new, :name)
    end
    
    it "recognizes a string" do
      input_for(:string).field_type.should == :string
    end
    
    it "recognizes a text field" do
      input_for(:text).field_type.should == :text
    end
  end
end