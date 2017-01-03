class LinkedList
	attr_accessor :name
	def initialize
		@head = nil
		@tail = nil
		@node_count = 0
	end

	def append(value)
		new_node = Node.new(value)
		@head = new_node if @head.nil?
		@tail.next = new_node unless @tail.nil?
		@tail = new_node
		@node_count += 1
	end

	def prepend(value)
		new_node = Node.new(value)
		new_node.next = @head
		@head = new_node
		@node_count += 1
	end

	def size
		return @node_count
	end

	def head
		return @head
	end

	def tail
		return @tail
	end

	def at(index)
		count = 0 
		node = @head
		until count == index
			count += 1
			node = node.next
		end
		return node
	end

	def pop
		count = 0 
		node = @head
		until count == ( @node_count - 2 )
			count += 1
			node = node.next
		end
		node.next = nil
		@tail = node
		@node_count -= 1
	end

	def contains? (value)
		@index = 0
		node = @head
		until node.next == nil
			return true if node.value == value
			node = node.next
			@index += 1
		end
		return true if @tail.value == value
		return false
	end

	def find (data)
		return @index if contains?(data)
	end

	def to_s
		node = @head
		string = ""
		until node.next == nil
			string = string + "( #{node.value} ) -> "
			node = node.next
		end
		string = string + "( #{node.value} ) -> nil"
		return string
	end

	def insert_at(index, data)
		count = 0 
		new_node = Node.new(data)
		node = @head
		until count == ( index - 1 )
			count += 1
			node = node.next
		end
		new_node.next = node.next
		node.next = new_node
	end

	def remove_at(index)
		count = 0 
		node_before = @head
		until count == ( index - 1 )
			count += 1
			node_before = node_before.next
		end
		removed_node = node_before.next
		node_after = removed_node.next
		node_before.next = node_after
	end


end

class Node
	attr_accessor :next, :value
	def initialize(data)
		@next = nil
		@value = data
	end
end

new_list = LinkedList.new
new_list.append("two")
new_list.append(3)
new_list.append("four")
new_list.append("five")
new_list.prepend("one")
new_list.prepend("zero")
p new_list.to_s
p new_list.at(3).value
new_list.pop
p new_list.to_s
p new_list.contains?("two")
p new_list.find("two")
p new_list.size
p new_list.head.value
p new_list.tail.value
new_list.insert_at(2, 2.5)
p new_list.to_s
new_list.remove_at(2)
p new_list.to_s
