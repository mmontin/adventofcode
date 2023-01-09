package adventutils.list

class Link<T> {

	public T value
	public Link<T> next
	public Link<T> previous

	new(T _value, Link<T> _previous) {
		value = _value
		next = null
		if(_previous !== null) _previous.next = this
		previous = _previous
	}

	def updateNext(Link<T> _next) {
		next = _next
		_next.previous = this
	}
	
	def get(int offset) {
		var output = this
		if (offset < 0)
			for (i : 0..<-offset)
				output = output.previous
		else
			for (i : 0..<offset)
				output = output.next
		output
	}

	def insertRight(Link<T> to_insert) {
		var prev = next
		updateNext(to_insert)
		to_insert.updateNext(prev)
	}

	def removeRight() {
		val new_right = next.next
		val output = next.value
		updateNext(new_right)
		output
	}

	override String toString() {
		value.toString
	}
}
