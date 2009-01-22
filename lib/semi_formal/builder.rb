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
      @inputs ||= @instance.class.content_columns.map do |column|
        Input.new(@instance, column.name)
      end
    end
    
    def form_attributes
      @form_attributes ||= Form.new(self).attributes
    end
  end
end