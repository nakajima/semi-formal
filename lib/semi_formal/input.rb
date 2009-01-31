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
        this.decorate(self)
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
    
    def field_type
      instance.class.columns_hash[name.to_s].type
    end
    
    def decorate(builder)
      this = self
      case field_type
      when :string
        builder.input(:name => attr_name, :type => "text", :value => value)
      when :text
        this = self
        builder.textarea(:name => attr_name) { text(this.value.to_s) }
      end
    end
  end
end