module SemiFormal
  class Input
    attr_reader :instance, :name
    
    def initialize(instance, name)
      @instance, @name = instance, name
    end
    
    def call(builder)
      this = self
      builder.label do
        span { text this.label_name }
        input(:name => this.attr_name, :type => "text", :value => this.value)
      end
    end
    
    alias_method :[], :call
    
    def value
      instance.send(name)
    end
    
    def label_name
      name.to_s.titleize
    end
    
    def attr_name
      instance.class.model_name.singular + "[#{name}]"
    end
  end
end