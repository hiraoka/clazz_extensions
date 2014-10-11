module ClazzExtensions
  class Array < Base
    @methoz = [:duplicate, :duplicate!, :unduplicate]
     def duplicate( clazz, _ )
       clazz.select { |v|
         clazz.count( v ) > 1
       }.uniq!
     end

     def duplicate!( clazz, _ )
       duplicate( clazz, args ).each { |v|
         clazz.delete( v )
       }
     end

     def unduplicate( clazz, _ )
       unduplicate_value = clazz.select { |v|
         clazz.count( v ) <= 1
       }
     end
   end
end

