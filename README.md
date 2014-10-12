#What is clazz_extensions

Add utility methods on defined class.

##example
```ruby
"example_class".classify             #=> "ExampleClass"
"example/class_a".classify           #=> "Example::ClassA"
[:a, :b, :c, :a, :d, :c].duplication #=> [:a, :c]
```

## How to Use
add all
```ruby
ClazzExtension.load do
  array :all
  string :all
end
```

add specific methods
```ruby
ClazzExtension.load do
  string add:  [:classify ]
  array  add:  [:duplication, :unduplication ]
end
```

add every methods that excluding specific
```ruby
ClazzExtension.load do
  string refect:  [:to_const ]
  array  refect:  [:duplication! ]
end
```


