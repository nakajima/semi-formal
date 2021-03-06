$LOAD_PATH << File.dirname(__FILE__)

require 'rubygems'
require 'nokogiri'
require 'activerecord'

require 'core_ext/object'
require 'core_ext/module'

require 'semi_formal/form'
require 'semi_formal/input'
require 'semi_formal/builder'

module SemiFormal
  def form_for(record)
    Builder.new(record).to_html
  end
end