class ClazzExtension
  class << self
    def load( &block )
      @clazzes ||= []
      self.new.load( &block )

      @clazzes.each do |clazz_name|
        clazz = const_get(clazz_name)
        clazz.method_define
        clazz.include!
      end
    end
    true
  end

  def load( &block )
    self.instance_eval(&block)
  end

  def method_missing( method, *args, &block )
    arg = args.first
    case arg
    when Symbol
      key = args.first
      param = []
    when Hash
      key = arg.keys.first
      param = arg[key]
    else
      raise
    end
    clazz_name = method.to_s.split("_").map { |str| str.capitalize }.join( "" )
    child_clazz = "ClazzExtensions::" + clazz_name

    if self.class.const_defined?( child_clazz )
      self.class.const_get( child_clazz ).__send__( key, param )
    end

    clazzes = self.class.instance_variable_get( :@clazzes )
    clazzes << child_clazz
    clazzes.flatten!
    self.class.instance_variable_set( :@clazzes, clazzes )
  end
end

Dir[File.join(__dir__, "clazz_extensions", "*.rb")].each { |f| require f }

