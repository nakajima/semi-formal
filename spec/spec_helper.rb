require 'rubygems'
require 'spec'
require 'acts_as_fu'
require 'elementor'
require 'elementor/spec'

require File.dirname(__FILE__) + '/../lib/semi_formal'

Spec::Runner.configure do |c|
  c.include Elementor
  c.mock_with(:rr)
end

build_model(:people) do
  string :name
  string :age
end

def new_instance
  Person.new
end

def new_builder(instance=new_instance)
  SemiFormal::Builder.new(instance)
end