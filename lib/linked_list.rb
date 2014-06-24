class LinkedList
  class Node
    attr_accessor :value, :next_node

    def initialize(value, next_node = nil)
      @value = value
      @next_node = next_node
    end
  end

  attr_accessor :head

  def append(value)
    if head
      this = head
      this = this.next_node while this.next_node
      this.next_node = Node.new(value)
    else
      prepend(value)
    end
  end

  def get(index)
    find_node(index).value
  end

  def prepend(value)
    @head = Node.new(value, head)
  end

  def insert_before(index, value)
    if index == 0
      prepend(value)
    else
      node_before = find_node(index - 1)
      node = find_node(index)
      node_before.next_node = Node.new(value, node)
    end
  end

  private

  def find_node(index)
    this = head
    index.times { this ? this = this.next_node : raise("Out Of Bounds") }
    this
  end
end
