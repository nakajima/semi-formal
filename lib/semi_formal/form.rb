module SemiFormal
  class Form
    attr_reader :builder
    
    def initialize(builder)
      @builder = builder
    end
    
    def attributes
      {
        :method => method,
        :action => action
      }
    end
    
    def method
      'post'
    end
    
    def action
      instances.inject('') do |path, instance|
        path += "/#{instance.class.model_name.plural}"
        path += "/#{instance.to_param}" unless instance.new_record?
        path
      end
    end
    
    private
    
    def instances
      builder.instances
    end
  end
end