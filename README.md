# Mystery Function

Consider the following mystery function in Ruby:

```ruby
def mystery_method(x)
  return Proc.new { |z| x.reduce(z) { |w, y| y.call(w) } }
end
```
From the mystery function we can see that the function returns a Proc object:
```ruby
Proc.new {  }
```
This limits the scope to local variables, which are then iterate through ```reduce``` via:
```ruby
x.reduce(z) { |w, y| y.call(w) }
```
The iteration over the given array keeps the running total through a binary operation that is executed for each element. The iteration is initialized at z and the block with local values with a reference to result and current value.

This mystery method is performing the following operation:

```ruby
function1.call(function2.call(x))
```
Which is a composition of functions. For this reason the method could be called function composition. Additionally, it could be re written like:
```ruby
def function_composition(*functions)
  functions.reduce { |f,g| lambda { |x| g.call(f.call(x)) } }
end
```

## To Run in terminal
```
$ ruby mystery_function.rb
```
For:
```
f(x) = x + 3
g(x) = X^2
h(x) = g(f(x)) = (x + 3)^2
h(1) = 16
h(2) = 25
```
