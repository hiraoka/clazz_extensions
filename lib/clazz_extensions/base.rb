module ClazzExtensions
  class Base
    class << self
      def add( methoz )
        @include_methoz ||= []
        @include_methoz << methoz
        @include_methoz.flatten!.uniq!
      end

      def all( _ )
        @include_methoz = instance_variable_get( :@methoz ).dup
      end

      def reject( methoz )
        @include_methoz ||= instance_variable_get( :@methoz ).dup
        delete( methoz )
      end

      def delete( methoz )
        m = exist_const_get( include_module )
        methoz.each { |method|
          if m and m.method_defined?( method )
            if @include_methoz.delete method
              m.instance_eval("remove_method( :#{method} )" ) if m
            end
          end
        }
      end

      def include!
        if const_defined? include_module
          clazz = exist_const_get("::" + target_class)
          clazz.instance_eval( "include( #{include_module} )" )
        end
      end

      def method_define
        @include_methoz.each do |m|
          if method_defined?( m )
            eval <<-QUIT
              module #{include_module}
                def #{m}( *args )
                  #{self}.new.__send__(:"#{m}", self, args)
                end
              end
            QUIT
          end
        end
      end

      def target_class
        self.to_s.split( "::" ).last
      end

      def exist_const_get( clazz_name )
        if const_defined?( clazz_name )
          const_get( clazz_name )
        end
      end

      def include_module
        eval <<-QUIT
          module ::Extension
          end
        QUIT
        "::Extension::" + self.to_s.split( "::" ).last
      end
    end
  end
end
