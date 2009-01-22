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
      stub(@faker_builder = Object.new).input(anything)
    end
    
    it "takes a Nokogiri builder context" do
      @input.call(@faker_builder)
    end
    
    it "creates an input for the builder" do
      mock(@faker_builder).input(anything)
      @input.call(@faker_builder)
    end
    
    it "passes the correct value" do
      @instance.age = "22"
      mock(@faker_builder).input(anything) do |options|
        options[:value].should == "22"
      end
      @input.call(@faker_builder)
    end
  end
end