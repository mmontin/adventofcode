package advent2021.puzzle23

import java.util.Stack

class Room {
	
	Stack<String> content
	String type
	int multiplicator
	
	new(int i) {
		content = new Stack()
		type = switch i {
			case 2 : 'A'
			case 4 : 'B'
			case 6 : 'C'
			default : 'D'
		}
		multiplicator = 1
	}
	
	def full() {
		content.size == 2
	}
	
	def accepts(String s) {
		s.equals(type) &&
		(content.isEmpty || (content.size == 1 && content.peek.equals(s))) 
	}
	
	def push(String s) {
		content.push(s)
		content.size == 2 ? 1 : 2 
	}
	
	def pop() {
		new Pair(content.pop , multiplicator++)
	}
}