module ClazzExtensions
  class Base
    class << self
      def only( methoz )
        @include_methoz ||= []
        @include_methoz << methoz
        @include_methoz.flatten!
      end

      def all( _ )
        @include_methoz = instance_variable_get( :@methoz )
      end

      def reject( methoz )
        @include_methoz ||= instance_variable_get( :@methoz )
        methoz.each do |method|
          @include_methoz.delete method
        end
      end

      def include!
        if const_defined? include_module
          const_get(target_class).instance_eval( "include( #{include_module} )" )
        end
      end

      def method_define
        @include_methoz.each do |m|
          if method_defined?( m )
            eval <<-QUIT
              module #{include_module}
                def #{m}( *args )
                  lambda { |clazz,args|
                    #{self}.new.__send__(:"#{m}", clazz, args)
                  }.call( self,args )
                end
              end
            QUIT
          end
        end
      end

      def target_class
        self.to_s.split( "::" ).last
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
