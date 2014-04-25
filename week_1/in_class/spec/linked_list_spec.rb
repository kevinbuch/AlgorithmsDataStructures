require 'rspec'
require 'linked_list'

describe LinkedList do
  describe LinkedList::Node do
    it 'creates a new node' do
      node = LinkedList::Node.new(1)
      expect(node.value).to eq 1
    end

    it 'creates a new node with a reference to next node' do
      next_node = LinkedList::Node.new(2)
      node = LinkedList::Node.new(1, next_node)
      expect(node.next_node).to eq next_node
    end
  end

  describe("#prepend") do
    it 'prepends nodes to an empty list' do
      list = LinkedList.new
      list.prepend(0)
      expect(list.head.value).to eq 0
    end

    it 'prepends multiple nodes' do
      list = LinkedList.new
      list.prepend(1)
      list.prepend(0)
      expect(list.head.value).to eq 0
      expect(list.head.next_node.value).to eq 1
    end
  end

  describe("#get") do
    it 'gets the value at index n' do
      list = LinkedList.new
      list.prepend(:c)
      list.prepend(:b)
      list.prepend(:a)
      expect(list.get(0)).to eq :a
      expect(list.get(1)).to eq :b
      expect(list.get(2)).to eq :c
    end
  end

  describe("#append") do
    it 'appends a node to empty list' do
      list = LinkedList.new
      list.append(1)
      expect(list.head.value).to eq 1
    end

    it 'appends multiple nodes' do
      list = LinkedList.new
      list.append(1)
      list.append(2)
      expect(list.head.value).to eq 1
      expect(list.head.next_node.value).to eq 2
    end
  end


  describe("#insert_before") do
    it 'inserts into the middle of a list' do
      list = LinkedList.new
      list.prepend(:end)
      list.prepend(:start)
      list.insert_before(1, :value)
      expect(list.head.value).to eq :start
      expect(list.head.next_node.value).to eq :value
      expect(list.head.next_node.next_node.value).to eq :end
    end

    it 'inserts into the beginning of a list' do
      list = LinkedList.new
      list.prepend(:initial_start)
      list.insert_before(0, :new_start)
      expect(list.head.value).to eq :new_start
      expect(list.head.next_node.value).to eq :initial_start
    end

    it 'fails to insert when out of bounds' do
      list = LinkedList.new
      expect { list.insert_before(100, :value) }.to raise_error("Out Of Bounds")
    end
  end
end
