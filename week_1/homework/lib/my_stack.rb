# Use a linked list to implement
# a Stack.

require_relative '../../in_class/lib/linked_list'

class MyStack
  def initialize
    self.linked_list = LinkedList.new
  end

  def push(element)
    linked_list.prepend(element)
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
