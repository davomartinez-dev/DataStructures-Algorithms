require 'byebug'

def transpose(_string)
  @arr_1 = []
  @arr_2 = []
  @str_1 = ''
  @count = 0

  _string.each_char do |ch|
    if ch == 'g'
      @arr_1.push(ch)
      @count += 1
    elsif ch == 'n' && @count > 0
      @arr_2.push(ch)
    elsif ch != 'n' && @count > 0
      @count.times do
        @arr_2.push(@arr_1.pop)
      end
      @count = 0
      @arr_2.push(ch)
    else
      @arr_2.push(ch)
    end
  end

  if @count > 0
    @count.times do
      @arr_2.push(@arr_1.pop)
    end
    @count
  end

  @arr_2.each do |ele|
    @str_1 += ele
  end

  @str_1
end

puts transpose('he was searchign on Bign for signign kigns')
# transpose('he was searchign on Bign for signign kigns')
# => he was searching on Bing for singing kings

# puts transpose('rignadingdiggn!')
puts transpose('rignadingdiggn!')
# # => ringadingdingg!

puts transpose('gngngnnggnngggnnn')
# # => nnnnnnnnngggggggg
