module ClazzExtensions
  class String < Base
    def classify( clazz, _ )
      to_class_name( clazz )
    end

    def to_const( clazz, _ )
      clazz_name = to_class_name( clazz )

      if Class.const_defined?( clazz_name )
        Class.const_get( clazz_name )
      else
        nil
      end
    end

    def classify2( clazz, args )
      to_class_name(  clazz + "_" + args.join("_") )
    end

    def each( clazz, args, &block )
      if block.respond_to?( :call )
        clazz.split("").each { |v|
          block.call( v )
        }
      end
      clazz
    end

    def each_with_index( clazz, args, &block )
      if block.respond_to?( :call )
        clazz.split("").each_with_index { |v,i|
          block( v, i )
        }
      end
      clazz
    end

    private
    def to_class_name( clazz )
      clazz.gsub("/","::_").split("_").map { |str| str.capitalize }.join( "" )
    end
  end
end
