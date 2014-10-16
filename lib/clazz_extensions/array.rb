module ClazzExtensions
  class Array < Base
    def duplication( clazz, _ )
      clazz.select { |v|
        clazz.count( v ) > 1
      }.uniq!
    end

    def blank?( clazz, _ )
      clazz.size == 0
    end

    def duplication!( clazz, _ )
      dupli = duplication( clazz, _ )
      array = clazz.dup
      array.each { |v|
        unless dupli.index( v )
          clazz.delete( v )
        end
      }
      clazz.uniq!
    end

    def unduplication( clazz, _ )
      unduplicate_value = clazz.select { |v|
        clazz.count( v ) <= 1
      }
    end
  end
end

