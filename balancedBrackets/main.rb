require 'byebug'

def balanced_brackets?(string)
  open_bra = '([{'
  close_bra = ')]}'
  stack = []
  string.each_char do |ele|
    if open_bra.include?(ele)
      stack.push(ele)
    else
      if close_bra.include?(ele)
        return false if stack.empty?

        res = stack.pop

        return false if res == '(' && ele != ')' || res == '[' && ele != ']' || res == '{' && ele != '}'
      end
    end
  end

  return true if stack.empty?

  false
end

puts balanced_brackets?('(hello)[world]')
# => true

puts balanced_brackets?('([)]')
# => false

puts balanced_brackets?('[({}{}{})([])]')
# => true
