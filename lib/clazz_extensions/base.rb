module ClazzExtensions
  class Base
    class << self
      def add( methoz )
        @include_methoz ||= []
        @include_methoz << methoz
        @include_methoz.flatten!.uniq!
      end

      def all( _ )
        @include_methoz = def_methoz
      end

      def reject( methoz )
        @include_methoz ||= def_methoz
        delete( methoz )
      end

      def reject_all( _ )
        delete( @include_methoz )
        @include_methoz = nil
      end

      def delete( methoz )
        m = exist_const_get( include_module )
        [methoz].flatten.compact.each { |method|
          if @include_methoz.delete method
            if m and m.method_defined?( method )
              m.instance_eval("remove_method( :#{method} )" ) if m
            end
          end
        }
      end

      def def_methoz
        self.new.public_methods - ClazzExtensions::Base.new.public_methods
      end

      def include!
        if const_defined? include_module
          clazz = exist_const_get("::" + target_class)
          clazz.instance_eval( "include( #{include_module} )" )
        end
      end

      def method_define
        [@include_methoz].flatten.compact.each do |m|
          if method_defined?( m )
            eval <<-QUIT
              module #{include_module}
                def #{m}( *args, &block )
                  #{self}.new.__send__(:"#{m}", self, args, &block)
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
