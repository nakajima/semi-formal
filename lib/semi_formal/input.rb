module SemiFormal
  class Input
    attr_reader :instance, :name
    
    def initialize(instance, name)
      @instance, @name = instance, name
    end
    
    def call(builder)
      builder.input(:name => attr_name, :type => "text", :value => instance.send(name))
    end
    
    private
    
    def attr_name
      instance.class.model_name.singular + "[#{name}]"
    end
  end
end