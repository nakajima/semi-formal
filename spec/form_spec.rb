require 'spec/spec_helper'

describe SemiFormal::Form do
  def new_form(builder=new_builder)
    SemiFormal::Form.new(builder)
  end
  
  it "takes an instance of a builder" do
    SemiFormal::Form.new(new_builder)
  end
  
  it "delegates instance to builder's instance" do
    form = new_form
    form.instance.should === form.builder.instance
  end
  
  it "sets the method to post" do
    new_form.method.should == 'post'
  end
  
  describe "action" do
    before(:each) do
      @instance = new_instance
      @builder = new_builder(@instance)
      @form = new_form(@builder)
    end
    
    context "when the instance is a new record" do
      it "returns the create route" do
        @form.action.should == "/people"
      end
    end
    
    context "when the instance is not a new record" do
      before(:each) do
        @instance.save!
      end
      
      it "returns the instance's resource route" do
        @form.action.should == "/people/#{@instance.to_param}"
      end
    end
  end
  
  describe "attributes" do
    it "returns an attributes hash" do
      new_form.attributes.should == { :method => 'post', :action => '/people' }
    end
  end
end
