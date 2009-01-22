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
      @input = SemiFormal::Input.new(new_instance, :age)
      stub(@faker_builder = Object.new).input(anything)
    end
    
    it "takes a Nokogiri builder context" do
      @input.call(@faker_builder)
    end
    
    it "creates an input for the builder" do
      mock(@faker_builder).input(:type => "text", :name => "person[age]")
      @input.call(@faker_builder)
    end
  end
end