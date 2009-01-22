require 'spec/spec_helper'

describe SemiFormal do
  
  it "takes a model object" do
    SemiFormal::Builder.new(new_instance)
  end

  describe "generating the form" do
    def body
      SemiFormal::Builder.new(@instance).to_html
    end
    
    before(:each) do
      @instance = new_instance
      
      @result = elements do |tag|
        tag.forms "form"
      end
    end
    
    it "generates a form" do
      @result.should have(1).form
    end
    
    describe "inputs" do
      before(:each) do
        @instance = new_instance
        @builder = new_builder(@instance)
      end
      
      it "returns Input instances for each attribute" do
        mock.proxy(SemiFormal::Input).new(@instance, 'age')
        mock.proxy(SemiFormal::Input).new(@instance, 'name')
        @builder.inputs
      end
    end
    
    describe "form_attributes" do
      it "instantiates a new SemiFormal::Form with self" do
        builder = new_builder
        mock.proxy(SemiFormal::Form).new(builder)
        builder.form_attributes
      end
      
      it "returns the attributes" do
        builder = new_builder
        builder.form_attributes.should == SemiFormal::Form.new(builder).attributes
      end
    end
  end
end