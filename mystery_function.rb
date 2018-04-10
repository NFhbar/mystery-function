def function_composition(*functions)
  functions.reduce { |f,g| lambda { |x| g.call(f.call(x)) } }
end

function1 = lambda { |x| x + 3 }
function2 = lambda { |x| x * x }

result = function_composition(*function1, *function2).call(1)
result2 = function_composition(*function1, *function2).call(2)

puts result
puts result2
