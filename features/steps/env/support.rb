require File.join(File.dirname(__FILE__), *%w[.. .. .. lib semi_formal])

require 'elementor'
require 'elementor/spec'
require 'acts_as_fu'

include Elementor
include ActsAsFu

require 'spec/expectations'