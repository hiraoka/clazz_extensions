module ClazzExtensions
  class Array < Base
     def duplication( clazz, _ )
       clazz.select { |v|
         clazz.count( v ) > 1
       }.uniq!
     end

     def duplication!( clazz, _ )
       duplicate( clazz, args ).each { |v|
         clazz.delete( v )
       }
     end

     def unduplication( clazz, _ )
       unduplicate_value = clazz.select { |v|
         clazz.count( v ) <= 1
       }
     end
   end
end

