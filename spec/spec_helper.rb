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
  timestamps
  
  has_many :friends
  
  attr_accessible :name, :age
end

build_model(:friends) do
  integer :person_id
  
  belongs_to :person
end

def new_instance
  Person.new
end

def new_builder(instance=new_instance)
  SemiFormal::Builder.new(instance)
end