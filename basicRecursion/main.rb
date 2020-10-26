require 'byebug'

def sum(_number)
  _number === 1 ? 1 : _number + sum(_number - 1)
end

puts sum(4)
puts sum(10)
