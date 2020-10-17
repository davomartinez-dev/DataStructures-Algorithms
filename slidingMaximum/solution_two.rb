require 'byebug'

def sliding_maximum(_k, _array)
  return -1 if _k >= _array.size

  result = []
  window_max = 0
  i = 0

  while i < _array.size
    window_max = _array[i] if _array[i] > window_max

    if i >= _k - 1
      result.push(window_max)
      window_max = _array[i]
    end

    i += 1
  end

  result
end

print sliding_maximum(3, [1, 3, 5, 7, 9, 2]) # [5, 7, 9, 9]
puts ''
print sliding_maximum(4, [9, 3, 5, 1, 7, 10]) # [9, 7, 10]
puts ''
print sliding_maximum(10, [9, 3, 5, 1, 7, 10]) # -1
puts ''
