package adventutils.list

import java.util.ArrayList
import java.util.List

class AgdaList<T> extends ArrayList<T> {
	
	override toString() {
		'(' + this.join(" ∷ ") + " ∷ [])"
	}
	
	new(List<T> list) {
		super(list)
	}
	
	new(Integer size) {
		super (size)
	}
	
	new() {
		super()
	}
}
