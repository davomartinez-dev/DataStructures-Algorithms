require 'byebug'

def sliding_maximum(k, array)
  return -1 if k > array.size

  result = []
  window_max = 0
  it = 0

  while it < array.length
    window_max = array[it] if array[it] > window_max

    if it >= k - 1
      result.push(window_max)
      window_max = array[it]
      byebug
    end

    it += 1
  end
  result
end

# print sliding_maximum(3, [1, 3, 5, 7, 9, 2]) # [5, 7, 9, 9]
print sliding_maximum(4, [9, 3, 5, 1, 7, 10]) # [9, 7, 10]
print sliding_maximum(3, [1, 3, 5, 7, 9, 2]) # [5, 7, 9, 9]
