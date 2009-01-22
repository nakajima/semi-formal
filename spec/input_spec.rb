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
end