module SemiFormal
  class Builder
    attr_reader :instance
    
    def initialize(instance)
      @instance = instance
    end
  
    def to_html
      Nokogiri::HTML::Builder.new {
        form(form_attributes) {
          method_overrider(self)
          inputs.each { |i| i.call(self) }
          input(:type => "submit") { text "Save!" }
        }
      }.doc.to_html
    end
    
    def method_overrider(doc)
      return if instance.new_record?
      doc.input(:type => "hidden", :name => "_method", :value => "put")
    end
    
    def inputs
      @inputs ||= klass.content_columns.map do |column|
        next unless klass.accessible_attributes.nil? or klass.accessible_attributes.include?(column.name)
        Input.new(@instance, column.name)
      end.compact
    end
    
    def form_attributes
      @form_attributes ||= Form.new(self).attributes
    end
    
    private
    
    def klass
      @instance.class
    end
  end
end