class TreeNode
  attr_accessor :value, :children

  def initialize(value)
    self.value = value
    self.children = []
  end

  def depth_first_flat_list
    children.reduce([value]) do |list, child|
      list += child.depth_first_flat_list
    end
  end

  def breadth_first_flat_list
    search = [self]
    while search.any? { |n| n.is_a?(TreeNode) }
      nodes = []
      search.map! do |n|
        if n.is_a?(TreeNode)
          nodes += n.children
          n.value
        else
          n
        end
      end
      search += nodes
    end
    search
  end
end

