#What is clazz_extensions

Add utility methods on defined class.

##example
```
"example_class".classify             #=> "ExampleClass"
"example/class_a".classify           #=> "Example::ClassA"
[:a, :b, :c, :a, :d, :c].duplication #=> [:a, :c]
```

## How to Use
add all
```
ClazzExtension.load do
  array :all
  string :all
end
```

add specific methods
```
ClazzExtension.load do
  array add:  [:classify ]
end
```

add every methods that excluding specific
```
ClazzExtension.load do
  array refect:  [:classify ]
end
```


