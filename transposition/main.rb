require 'byebug'

def transpose(_string)
  arr_g = []
  arr_result = []
  str_result = ''

  _string.each_char do |char|
    if char == 'g'
      arr_g.push(char)
    elsif char == 'n' && arr_g.length > 0
      arr_result.push(char)
    elsif char != 'n' && arr_g.length > 0
      arr_result.push(arr_g.pop) until arr_g.empty?
      arr_result.push(char)
    else
      arr_result.push(char)
    end
  end

  arr_result.push(arr_g.pop) until arr_g.empty? if arr_g.length > 0

  arr_result.each do |ele|
    str_result += ele
  end

  str_result
end

# Time Complexity -> O(n)
# Space Complexity -> O(n)

puts transpose('he was searchign on Bign for signign kigns')
# transpose('he was searchign on Bign for signign kigns')
# => he was searching on Bing for singing kings

# puts transpose('rignadingdiggn!')
puts transpose('rignadingdiggn!')
# => ringadingdingg!

puts transpose('gngngnnggnngggnnn')
