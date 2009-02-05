require 'spec/spec_helper'

describe SemiFormal::Form do
  def new_form(builder=new_builder)
    SemiFormal::Form.new(builder)
  end
  
  it "takes an instance of a builder" do
    SemiFormal::Form.new(new_builder)
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
    
    context "when the instance is actually an array" do
      before(:each) do
        @instance.save!
        @child = @instance.friends.create!
        @builder = new_builder([@instance, @child])
      end
      
      it "returns nested action" do
        new_form(@builder).action.should == "/people/#{@instance.to_param}/friends/#{@child.to_param}"
      end
    end
  end
  
  describe "attributes" do
    it "returns an attributes hash" do
      new_form.attributes.should == { :method => 'post', :action => '/people' }
    end
  end
end
