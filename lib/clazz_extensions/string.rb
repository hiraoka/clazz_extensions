module ClazzExtensions
  class String < Base
    def classify
      lambda { |clazz, args|
        to_class_name( clazz )
      }
    end

    def to_const
      lambda { |clazz, args|
        clazz_name = to_class_name( clazz )

        if Class.const_defined?( clazz_name )
          Class.const_get( clazz_name )
        else
          nil
        end
      }
    end

    def classify2
      lambda { |clazz, args|
        to_class_name(  clazz + "_" + args.join("_") )
      }
    end

    private
    def to_class_name( clazz )
      clazz.gsub("/","::_").split("_").map { |str| str.capitalize }.join( "" )
    end
  end
end
