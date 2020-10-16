require 'byebug'

# Start with your code from last challenge.
class Node
  attr_accessor :value, :next_node

  def initialize(value, next_node = nil)
    @value = value
    @next_node = next_node
  end
end

class LinkedList
  def initialize
    @head = nil
    @tail = nil
  end

  def add(number)
    new_node = Node.new(number)
    if @head.nil?
      @head = new_node
      @tail = new_node
    else
      @tail.next_node = new_node
      @tail = new_node
    end
  end

  def add_at(index, number)
    new_node = Node.new(number)
    if @head.nil?
      @head = new_node
      @tail = new_node
    else
      if index.zero?
        new_node.next_node = @head
        @head = new_node
      else
        previous = @head
        (index - 1).times do
          previous = previous.next_node
        end
        current = previous.next_node
        new_node.next_node = current
        previous.next_node = new_node
      end
    end
  end

  def remove(index)
    if @head.nil?
      nil
    else
      if index.zero?
        @head = @head.next_node
      else
        previous = @head
        (index - 1).times do
          previous = previous.next_node
        end
        current = previous.next_node
        previous.next_node = current.next_node
      end
    end
  end

  def get(index)
    return -1 if @head.nil?

    current = @head
    index.times do
      current = current.next_node
    end
    current.value
  end
end

class Queue
  def initialize
    @queue = LinkedList.new
  end

  def add(number)
    @queue.add(number)
  end

  def remove
    result = @queue.get(0)
    @queue.remove(0)
    result
  end
end

queue = Queue.new

queue.add(3)
queue.add(5)
puts queue.remove
# => 3

queue.add(2)
queue.add(7)
puts queue.remove
# => 5

puts queue.remove
# => 2

puts queue.remove
# => 7

puts queue.remove
# => -1
