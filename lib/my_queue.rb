# Use a linked list to implement
# a Queue.

require 'linked_list'

class MyQueue
  def initialize
    self.linked_list = LinkedList.new
  end

  def push(element)
    linked_list.append(element)
  end

  def pop
    this = linked_list.head
    if this
      linked_list.head = this.next_node
      this.value
    end
  end

  private
  attr_accessor :linked_list
end
