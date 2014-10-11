#What is clazz_extensions

Add utility methods on defined class.

##example
```
"string".classify                  #=> "String"
[:a, :b, :c, :a, :d, :c].duplicate #=> [:a, :c]
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


