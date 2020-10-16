class Node
  attr_accessor :value, :next_node
  def initialize(value, next_node = nil)
    @value = value
    @next_node = next_node
  end
end
initialize

class LinkedList
  # setup head and tail
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

  def get(index)
    if @head.nil?
      -1
    else
      current = @head
      index.times do
        current = current.next_node
      end
      current.value
    end
  end

  def add_at(index, item)
    new_node = Node.new(item)
    if @head.nil?
      @head = new_node
      @tail = new_node
    else
      current = @head
      if index.zero?
        new_node.next_node = @head
        @head = new_node
      else
        (index - 1).times do
          current = current.next_node
        end
        new_node.next_node = current.next_node
        current.next_node = new_node
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
        current_at = @head
        (index - 1).times do
          current_at = current_at.next_node
        end
        tmp = current_at.next_node
        current_at.next_node = tmp.next_node
      end
    end
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
    temporal = @queue.get(0)
    @queue.remove(0)
    temporal
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
