class Node
  attr_accessor :parent, :left_child, :right_child, :value

  def initialize(parent, left_child, right_child, value)
    @parent = parent
    @left_child = left_child
    @right_child = right_child
    @value = value
  end
end

def build_tree(array, parent=nil)
  if array.length < 2
    tree = Node.new(parent, nil, nil, array[0])
  else
    left = []
    right = []
    node = array[0]

    array.each_with_index do |val, i|
      next if i == 0

      if val <= node
        left << val
      else
        right <<val
      end
    end

    left_node = build_tree(left)
    right_node = build_tree(right)

    tree = Node.new(parent, left_node, right_node, node)
    left_node.parent = tree
    right_node.parent = tree
  end

  return tree
end

def breadth_first_search(target_val, tree)
  node = tree
  queue = []

  while true
    unless node == nil
      return node if node.value == target_val

      queue << node.left_child
      queue << node.right_child
    end

    return nil if queue == []
    node = queue.shift
  end
end

def depth_first_search(target_val, tree)
  node = tree
  stack = []

  while true
    unless node == nil
      return node if node.value == target_val

      stack << node.left_child
      stack << node.right_child
    end

    return nil if stack == []
    node = stack.pop
  end
end

def dfs_rec(target_val, tree)
  return tree if tree.value == target_val

  result = dfs_rec(target_val, tree.left_child) if tree.left_child != nil
  result = dfs_rec(target_val, tree.right_child) if tree.right_child != nil

  return result ||= nil
end
